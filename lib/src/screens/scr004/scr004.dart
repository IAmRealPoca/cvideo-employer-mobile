import 'package:cvideo_employer_mobile/src/app_components/app_bottom_navigation.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/header.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/header_loading.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SCR004 extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SCR004State createState() => _SCR004State();
}

class _SCR004State extends State<SCR004> with SingleTickerProviderStateMixin {
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
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    int postId = args.postId;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (authenContext, authenState) {
        if (authenState is AuthenticationFailure) {
          return Scaffold(
              bottomNavigationBar: AppBottomNavigationBar(
                currentIndex: 0,
              ),
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.SCR003_SCREEN);
                  },
                ),
                iconTheme: IconThemeData(
                  color: AppColors.primaryColor,
                ),
                title: Text(AppLocalizations.of(context)
                    .translate("scr004.titleAppBar")),
                centerTitle: true,
                elevation: 0,
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
              )));
        } else {
          return Scaffold(
              bottomNavigationBar: AppBottomNavigationBar(
                currentIndex: 0,
              ),
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.SCR003_SCREEN);
                  },
                ),
                iconTheme: IconThemeData(
                  color: AppColors.primaryColor,
                ),
                title: Text(AppLocalizations.of(context)
                    .translate("scr004.titleAppBar")),
                centerTitle: true,
                elevation: 0,
              ),
              body: BlocProvider<LoadListCVBloc>(
                create: (context) {
                  return LoadListCVBloc(
                      RecruitmentRepository(Recruitmentrovider()))
                    ..add(FetchInforCvApplyEvent(postId: postId));
                },
                child: BlocBuilder<LoadListCVBloc, LoadListCVApplyState>(
                    builder: (blocContext, blocState) {
                  if (blocState is LoadListCVApplyInitial) {
                    return HeaderLoading(
                      tabController: _tabController,
                    );
                  }
                  if (blocState is LoadListCVApplyLoading) {
                    return HeaderLoading(
                      tabController: _tabController,
                    );
                  }
                  if (blocState is LoadListCVApplySuccess) {
                    return Header(
                      recruitment: blocState.recruitment,
                      tabController: _tabController,
                      listApplied: blocState.listApplied,
                    );
                  }
                  return Container(
                    child: Center(
                      child: Text("load failed"),
                    ),
                  );
                }),
              ));
        }
      },
    );
  }
}

class ScreenArguments {
  final int postId;
  ScreenArguments({this.postId});
}
