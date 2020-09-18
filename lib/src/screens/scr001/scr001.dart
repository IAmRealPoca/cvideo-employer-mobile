/*
 * File: scr001.dart
 * Project: CVideo
 * File Created: Thursday, 4th June 2020 10:41 am
 * Author: luonglvse130702 (luonglvse130702@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 4th June 2020 3:02 pm
 * Modified By: luonglvse130702 (luonglvse130702@fpt.edu.vn>)
 * -----
 * Copyright (c) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';

import './rounded_login_button.dart';

class SCR001 extends StatelessWidget {
  /// Dependency for [LoginRepository]
  final LoginRepository _loginRepository = FirebaseLoginRepository();

  /// Dependency for [FirebaseMessaging]
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  SCR001({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Set screen rotation to only vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Create progress dialog for login loading
    final ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      message:
          AppLocalizations.of(context).translate("scr001.infoLoginLoading"),
      backgroundColor: Colors.white,
      borderRadius: 10.0,
      progressWidget: Container(
        padding: EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          backgroundColor: AppColors.primaryColor,
          valueColor: AlwaysStoppedAnimation(AppColors.primaryLightColor),
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 19.0,
        fontWeight: FontWeight.w500,
      ),
    );

    /// Set screen rotation to only vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Get the [size] of the screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
            loginRepository: _loginRepository,
            firebaseMessaging: _firebaseMessaging),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            /// If login is processing
            if (state is LoginStateLoading) {
              progressDialog.show();
            }

            /// Process for the login failed.
            if (state is LoginStateFailure) {
              progressDialog.hide();
              Scaffold.of(context)

                /// Show snackbar to inform user the login failed.
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          /// Show error message
                          AppLocalizations.of(context).translate(state.errMsg),
                          style: TextStyle(
                            color: AppColors.loginTextColor,
                          ),
                        ),
                        Icon(
                          Icons.error,
                          color: AppColors.loginTextColor,
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
            }

            /// Process for login success.
            if (state is LoginStateSuccess) {
              progressDialog.hide();
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLoggedIn());
                  
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    /// Define backgound of the screen
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: size.width,
                        height: size.height,
                        child: Image.asset(
                          "assets/screens/scr001/login_bg.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.18),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/screens/scr001/app_logo.png",
                              width: size.width * 0.62,
                            ),
                            SizedBox(width: size.width * 0.05),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          /// Google login
                          RoundedLoginButton(
                            text: AppLocalizations.of(context)
                                .translate("scr001.btnLoginByGG"),
                            iconPath: "assets/screens/scr001/google_g.svg",
                            press: () {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginWithGooglePressed(),
                              );
                            },
                          ),
                          SizedBox(height: 4.0),

                          /// Facebook login button
                          RoundedLoginButton(
                            text: AppLocalizations.of(context)
                                .translate("scr001.btnLoginByFB"),
                            iconPath: "assets/screens/scr001/facebook_f.svg",
                            press: () {},
                          ),
                          SizedBox(height: size.height * 0.1),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
