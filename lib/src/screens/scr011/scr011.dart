import 'package:cvideo_employer_mobile/src/app_components/app_bottom_navigation.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/list_cv_repository/list_cv_provider.dart';
import 'package:cvideo_employer_mobile/src/repositories/list_cv_repository/list_cv_repository.dart';
import 'package:cvideo_employer_mobile/src/screens/scr011/ui/scr011_header.dart';
import 'package:cvideo_employer_mobile/src/screens/scr011/ui/scr011_loading.dart';
import 'package:cvideo_employer_mobile/src/screens/scr011/ui/sizes_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SCR011 extends StatefulWidget {
  @override
  _SCR011State createState() => _SCR011State();
}

class _SCR011State extends State<SCR011> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String lang = AppLocalizations.of(context).locale.languageCode;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (cauthenContext, authenState) {
        if (authenState is AuthenticationFailure) {
          return Scaffold(
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: 1,
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.SCR001_SCREEN);
                },
              ),
              iconTheme: IconThemeData(
                color: AppColors.primaryColor, //change your color here
              ),
              title:
                  Text(AppLocalizations.of(context).translate("scr006.title")),
              centerTitle: true,
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
          return BlocProvider<ListCvAppliedBloc>(
            create: (context) {
              return ListCvAppliedBloc(ListCvRepository(ListCvProvider()))
                ..add(FetchListCvAppliedCompany(companyId: 2));
            },
            child: Builder(
              builder: (blocContext) {
                return Scaffold(
                  bottomNavigationBar: AppBottomNavigationBar(
                    currentIndex: 1,
                  ),
                  body: BlocBuilder<ListCvAppliedBloc, ListCvAppliedState>(
                    builder: (context, state) {
                      if (state is ListCvAppliedInitial) {
                        return SCR011_LOADING(
                          tabController: _tabController,
                        );
                      }
                      if (state is ListCvAppliedLoading) {
                        return SCR011_LOADING(
                          tabController: _tabController,
                        );
                      }
                      if (state is ListCvAppliedSuccess) {
                        return SCR011_Header(
                          tabController: _tabController,
                          listApplied: state.listApplied,
                        );
                      }
                      return Text("Load failed");
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
