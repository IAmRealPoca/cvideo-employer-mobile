import 'dart:async';
import 'dart:convert';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;
  final FirebaseMessaging _firebaseMessaging;

  LoginBloc(
      {@required LoginRepository loginRepository,
      @required FirebaseMessaging firebaseMessaging})
      : assert(loginRepository != null),
        _loginRepository = loginRepository,
        _firebaseMessaging = firebaseMessaging,
        super(LoginStateInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithFacebookPressed) {
      yield* _mapLoginWithFacebookPressedToState();
    }
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      yield LoginStateLoading();
      //GoogleSignIn googleSignIn = new GoogleSignIn();
      FirebaseUser currentUser = await _loginRepository.signIn();

      var idToken = await currentUser.getIdToken();

      var googleResponse = await AppHttpClient.post(
        "/auth/google",
        headers: {"Content-Type": "application/json"},

        /// Flg = 2 for employer
        body: jsonEncode(
            <String, String>{'token': '${idToken.token}', 'flg': '2'}),
      );

      if (googleResponse.statusCode != 200) {
        _loginRepository.signOut();
        yield LoginStateFailure(errMsg: SCR001Constants.API_TOKEN_ERR);
        return;
      }

      /// Get token from server's repnse
      String token = jsonDecode(googleResponse.body)["token"];

      print("API_token: $token");

      // Create storage
      AppStorage appStorage = AppStorage.instance;

      /// Write token to storage
      await appStorage.writeSecureApiToken(token);

      /// Send fcm token to server
      var fcmToken = await _firebaseMessaging.getToken();

      /// Send fcm's token to server
      var fcmReponse = await AppHttpClient.post(
        "/fcm/devices",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "bearer $token"
        },
        body: jsonEncode({"deviceId": "$fcmToken"}),
      );

      /// Notify when fcm can not send to server
      if (fcmReponse.statusCode != 201) {
        yield LoginStateFailure(errMsg: SCR001Constants.FCM_ERR);
      }

      yield LoginStateSuccess();
    } catch (_) {
      yield LoginStateFailure(errMsg: SCR001Constants.LOGIN_FAIL_ERR);
    }
  }

  Stream<LoginState> _mapLoginWithFacebookPressedToState() async* {
    yield LoginStateSuccess();
  }
}
