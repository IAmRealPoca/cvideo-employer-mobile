import 'dart:async';

import 'package:cvideo_employer_mobile/src/app_components/app_bottom_navigation.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:cvideo_employer_mobile/src/screens/scr008/ui/cv_detail_loading.dart';
import 'package:cvideo_employer_mobile/src/screens/scr008/ui/cv_detail_ui.dart';
import 'package:cvideo_employer_mobile/src/screens/scr008/ui/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SCR008 extends StatefulWidget {
  @override
  _SCR008State createState() => _SCR008State();
}

class _SCR008State extends State<SCR008> {
  Completer<void> _refreshCompleter;
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    //variables
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    String lang = AppLocalizations.of(context).locale.languageCode;
    int postId = args.postId;
    int applicationId = args.applicationId;
    BuildContext contextList = args.contextList;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //build ui
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (authenContext, authenState) {
        if (authenState is AuthenticationFailure) {
          return Scaffold(
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: 0,
            ),
            // appBar: AppBar(
            //   leading: IconButton(
            //     icon: Icon(
            //       Icons.arrow_back_ios,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(AppRoutes.SCR001_SCREEN);
            //     },
            //   ),
            //   iconTheme: IconThemeData(
            //     color: AppColors.primaryColor, //change your color here
            //   ),
            //   title:
            //       Text(AppLocalizations.of(context).translate("scr006.title")),
            //   centerTitle: true,
            // ),
            body: Center(
                child: Container(
              height: displayHeight(context) * .06,
              width: displayWidth(context) * .4,
              child: RawMaterialButton(
                  elevation: 2,
                  fillColor: AppColors.primaryColor,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)
                              .translate("scr0010.btnLogin"),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.SCR001_SCREEN);
                  }),
            )),
          );
        } else {
          return BlocProvider<CVDetailBloc>(
            create: (context) {
              return CVDetailBloc(DetailCVRepository(DetailCVProvider()))
                ..add(FetchCVDetail(
                    lang: lang, applicationId: applicationId, postId: postId));
            },
            child: Builder(builder: (blocContext) {
              return Scaffold(
                bottomNavigationBar: AppBottomNavigationBar(
                  currentIndex: 0,
                ),
                // appBar: AppBar(
                //   leading: IconButton(
                //     icon: Icon(
                //       Icons.arrow_back_ios,
                //       color: Colors.white,
                //     ),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //   ),
                //   iconTheme: IconThemeData(
                //     color: AppColors.primaryColor,
                //   ),
                //   title: Text(
                //       AppLocalizations.of(context).translate("scr008.back")),
                // ),
                body: BlocBuilder<CVDetailBloc, CVDetailState>(
                  builder: (context, state) {
                    if (state is CVDetailInitialState) {
                      return CvDetailLoad();
                    }
                    if (state is CVDetailLoadingState) {
                      return CvDetailLoad();
                    }
                    if (state is CVDetailLoadSuccessState) {
                      _refreshCompleter?.complete();
                      _refreshCompleter = Completer();
                      return RefreshIndicator(
                        child: buildContent(
                            context,
                            state.cvDetail.employee,
                            state.cvDetail.sessions,
                            state.cvDetail,
                            blocContext,
                            lang),
                        onRefresh: () {
                          BlocProvider.of<CVDetailBloc>(context)
                            ..add(FetchCVDetail(
                                applicationId: applicationId,
                                postId: postId,
                                lang: lang));
                          return _refreshCompleter.future;
                        },
                      );
                    }
                    return Text(AppLocalizations.of(context)
                        .translate("scr008.buildFailed"));
                  },
                ),
              );
            }),
          );
        }
      },
    );
  }
}

class ScreenArguments {
  final int postId;
  final int applicationId;
  final BuildContext contextList;
  ScreenArguments({this.applicationId, this.postId, this.contextList});
}
