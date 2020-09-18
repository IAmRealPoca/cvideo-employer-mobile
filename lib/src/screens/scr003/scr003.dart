import 'package:cvideo_employer_mobile/src/app_components/app_bottom_navigation.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/employer_repository/employer_provider.dart';
import 'package:cvideo_employer_mobile/src/repositories/employer_repository/employer_repository.dart';
import 'package:cvideo_employer_mobile/src/screens/scr003/recruitment_card_loading.dart';
import 'package:cvideo_employer_mobile/src/screens/scr003/statistics_section._loading.dart';
import 'package:cvideo_employer_mobile/src/screens/scr007/scr007.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'recruitment_card.dart';
import 'statistics_section.dart';

class SCR003 extends StatefulWidget {
  @override
  _SCR003State createState() => _SCR003State();
}

class _SCR003State extends State<SCR003> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 0,
      ),
      body: BlocProvider<SCR003Bloc>(
        create: (context) => SCR003Bloc(EmployerRepository(EmployerProvider()))
          ..add(SCR003EventLoad()),
        child: BlocBuilder<SCR003Bloc, SCR003State>(
          builder: (context, scr003state) {
            /// When data is load success
            if (scr003state is SCR003StateSuccess) {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.SCR007_SCREEN,
                        arguments: SCR007Arguments(
                            companyId: scr003state.statistics.companyId));
                  },
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
                body: Container(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: <Widget>[
                      StatisticsSection(
                          statisticsModel: scr003state.statistics),

                      /// Tabbar section
                      Container(
                        color: AppColors.primaryDarkColor,
                        child: TabBar(
                          indicatorColor: AppColors.primaryLightColor,
                          labelColor: AppColors.secondaryTextColor,
                          labelStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelColor: AppColors.secondaryTextColor,
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                          controller: _controller,
                          tabs: [
                            /// First tab title
                            Tab(
                              text: AppLocalizations.of(context)
                                  .translate("scr003.recruitmentingTab"),
                            ),

                            /// Second tab title
                            Tab(
                              text: AppLocalizations.of(context)
                                  .translate("scr003.recruitmentExpiredTab"),
                            ),
                          ],
                        ),
                      ),

                      /// Tabbar view section
                      Expanded(
                        child: TabBarView(
                          controller: _controller,
                          children: <Widget>[
                            /// First tab
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: scr003state.listRecruitmentings.length > 0
                                  ? ListView.builder(
                                      itemCount: scr003state
                                          .listRecruitmentings.length,
                                      itemBuilder: (context, index) =>
                                          RecruitmentCard(
                                        recruitmentModel: scr003state
                                            .listRecruitmentings[index],
                                      ),
                                    )
                                  : buildEmptyJobSection(),
                            ),

                            /// Section tab
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child:
                                  scr003state.listExpiredRecruitments.length > 0
                                      ? ListView.builder(
                                          itemCount: scr003state
                                              .listExpiredRecruitments.length,
                                          itemBuilder: (context, index) =>
                                              RecruitmentCard(
                                            recruitmentModel: scr003state
                                                .listExpiredRecruitments[index],
                                          ),
                                        )
                                      : buildEmptyJobSection(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (scr003state is SCR003StateFailure) {
              /// When data is loaded failed
              return Center(
                child: Text(
                  /// Show error msg to user
                  AppLocalizations.of(context)
                      .translate("scr003.loadDataError"),
                ),
              );
            }

            // When data is loading
            return Container(
              width: size.width,
              height: size.height,
              child: Column(
                children: <Widget>[
                  StatisticsSectionLoading(),

                  /// Tabbar section
                  Container(
                    color: AppColors.primaryDarkColor,
                    child: TabBar(
                      indicatorColor: AppColors.primaryLightColor,
                      labelColor: AppColors.secondaryTextColor,
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelColor: AppColors.secondaryTextColor,
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      controller: _controller,
                      tabs: [
                        /// First tab title
                        Tab(
                          text: AppLocalizations.of(context)
                              .translate("scr003.recruitmentingTab"),
                        ),

                        /// Second tab title
                        Tab(
                          text: AppLocalizations.of(context)
                              .translate("scr003.recruitmentExpiredTab"),
                        ),
                      ],
                    ),
                  ),

                  /// Tabbar view section
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        /// First tab
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) =>
                                RecruitmentCardLoading(),
                          ),
                        ),

                        /// Section tab
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) =>
                                RecruitmentCardLoading(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column buildEmptyJobSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              "assets/screens/scr003/ic_empty_job.svg",
              width: 50.0,
            ),
            Text(
              AppLocalizations.of(context).translate("scr003.noJobTitle"),
              style: TextStyle(
                color: AppColors.primaryTextColor.withOpacity(0.6),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
