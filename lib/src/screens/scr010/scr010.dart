import 'package:cvideo_employer_mobile/src/app_components/app_bottom_navigation.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/sizes_helpers.dart';
import 'package:cvideo_employer_mobile/src/screens/scr010/ui/scr010_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SCR010 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String lang = AppLocalizations.of(context).locale.languageCode;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (authenContext, authenState) {
        if (authenState is AuthenticationFailure) {
          return Scaffold(
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: 2,
            ),
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
          return BlocProvider<CompanyDetailBloc>(
            create: (context) {
              return CompanyDetailBloc(CompanyRepository(CompanyProvider()))
                ..add(FetchInforCompany(lang: lang));
            },
            child: Builder(
              builder: (blocContext) {
                return Scaffold(
                  bottomNavigationBar: AppBottomNavigationBar(
                    currentIndex: 2,
                  ),
                  body: BlocBuilder<CompanyDetailBloc, CompanyDetailState>(
                    builder: (context, state) {
                      if (state is CompanyDetailInitialState) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                AppColors.primaryDarkColor),
                          ),
                        );
                      }
                      if (state is CompanyDetailLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                AppColors.primaryDarkColor),
                          ),
                        );
                      }
                      if (state is CompanyDetailSuccessState) {
                        return CompanyDetailPage(
                          company: state.company,
                          blocContext: context,
                        );
                      }
                      if (state is UpdateCompanySuccessState) {
                        return CompanyDetailPage(
                          company: state.company,
                          blocContext: context,
                        );
                      }
                      return Text(AppLocalizations.of(context)
                          .translate("scr010.buildFailed"));
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
