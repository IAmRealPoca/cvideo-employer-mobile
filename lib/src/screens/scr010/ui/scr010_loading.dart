import 'dart:math';

import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/sizes_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class CompanyLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      height: displayHeight(context),
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //header
              Container(
                color: AppColors.primaryColor,
                width: displayWidth(context),
                height: displayHeight(context) * 0.21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //avatar
                    Padding(
                      padding: EdgeInsets.fromLTRB(14, 12, 4, 8),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.baseColorLoading,
                        highlightColor: AppColors.hightlightColorLoading,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: displayHeight(context) * 0.178,
                              width: displayWidth(context) * 0.3,
                              color: AppColors.secondaryTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //information
                    Container(
                      height: displayHeight(context) * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Shimmer.fromColors(
                              baseColor: AppColors.baseColorLoading,
                              highlightColor: AppColors.hightlightColorLoading,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //name
                                  Container(
                                    height: displayHeight(context) * 0.05,
                                    width: displayWidth(context) * 0.6,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                  SizedBox(height: 13),
                                  //ngay sinh
                                  Container(
                                    height: displayHeight(context) * 0.04,
                                    width: displayWidth(context) * 0.6,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                  SizedBox(height: 10),
                                  //gioi tinh
                                  Container(
                                    height: displayHeight(context) * 0.04,
                                    width: displayWidth(context) * 0.6,
                                    color: AppColors.secondaryTextColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //description
              Container(
                width: displayWidth(context),
                height: displayHeight(context),
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Shimmer.fromColors(
                          baseColor: AppColors.baseColorLoading,
                          highlightColor: AppColors.hightlightColorLoading,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: displayHeight(context) * 0.03,
                                width: displayWidth(context),
                                color: AppColors.secondaryTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
