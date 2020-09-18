import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/screens/scr011/ui/sizes_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SCR011_LOADING extends StatelessWidget {
  final TabController tabController;

  const SCR011_LOADING({Key key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: displayWidth(context),
        height: displayHeight(context),
        color: AppColors.primaryColor,
        child: Container(
          margin: EdgeInsets.only(top: 24.0),
          width: size.width,
          // height: displayHeight(context) * 0.37,
          color: AppColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //tab bar
              Container(
                color: AppColors.primaryDarkColor,
                child: TabBar(
                    controller: tabController,
                    labelColor: AppColors.secondaryTextColor,
                    labelStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 2.0, color: AppColors.primaryLightColor),
                      ),
                    ),
                    tabs: [
                      Tab(
                        text: AppLocalizations.of(context)
                            .translate("scr004.tabbarNewCV"),
                      ),
                      Tab(
                        text: AppLocalizations.of(context)
                            .translate("scr004.tabbarTotalCV"),
                      ),
                    ]),
              ),
              //body
              Expanded(
                child: Container(
                  color: AppColors.secondaryTextColor,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                height: displayHeight(context) * 0.23,
                                padding: EdgeInsets.all(10.0),
                                child: Card(
                                  child: Shimmer.fromColors(
                                    baseColor: AppColors.baseColorLoading,
                                    highlightColor:
                                        AppColors.hightlightColorLoading,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          /// First row in the card: Job title
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            height: 18.0,
                                            width: size.width * 0.3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),

                                          /// Second row in the card: due date
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            height: 18.0,
                                            width: size.width * 0.7,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),

                                          /// Four
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            height: 15.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),

                                          /// Thrid row in the card: expected quantity
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            height: 15.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                height: displayHeight(context) * 0.23,
                                padding: EdgeInsets.all(10.0),
                                child: Card(
                                  child: Shimmer.fromColors(
                                    baseColor: AppColors.baseColorLoading,
                                    highlightColor:
                                        AppColors.hightlightColorLoading,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          /// First row in the card: Job title
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            height: 18.0,
                                            width: size.width * 0.3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),

                                          /// Second row in the card: due date
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            height: 18.0,
                                            width: size.width * 0.7,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),

                                          /// Four
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            height: 15.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),

                                          /// Thrid row in the card: expected quantity
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            height: 15.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0)),
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
