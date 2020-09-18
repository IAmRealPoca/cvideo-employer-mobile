import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/sizes_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CvDetailLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: displayWidth(context),
        height: displayHeight(context),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //cv title
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: AppColors.baseColorLoading,
                    highlightColor: AppColors.hightlightColorLoading,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            color: AppColors.secondaryTextColor,
                          ),
                          height: displayHeight(context) * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
                //gach chan
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.0005,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: AppColors.primaryDarkColor,
                        width: 1.0,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //user infor
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //infor
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(4),
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
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 13),
                                  //ngay sinh
                                  Container(
                                    height: displayHeight(context) * 0.04,
                                    width: displayWidth(context) * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  //gioi tinh
                                  Container(
                                    height: displayHeight(context) * 0.03,
                                    width: displayWidth(context) * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  //dien thoai
                                  Container(
                                    height: displayHeight(context) * 0.035,
                                    width: displayWidth(context) * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //image
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.baseColorLoading,
                        highlightColor: AppColors.hightlightColorLoading,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: displayHeight(context) * 0.2,
                              width: displayWidth(context) * 0.3,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //section
                for (int i = 0; i < 2; i++)
                  Container(
                    height: displayHeight(context) * 0.42,
                    width: displayWidth(context),
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //section name
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Shimmer.fromColors(
                            baseColor: AppColors.baseColorLoading,
                            highlightColor: AppColors.hightlightColorLoading,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: displayHeight(context) * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //gach chan
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: displayWidth(context),
                            height: displayHeight(context) * 0.0005,
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: AppColors.primaryDarkColor,
                                width: 1.0,
                              )),
                            ),
                          ),
                        ),
                        //section text
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Shimmer.fromColors(
                            baseColor: AppColors.baseColorLoading,
                            highlightColor: AppColors.hightlightColorLoading,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: displayHeight(context) * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //field
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Shimmer.fromColors(
                            baseColor: AppColors.baseColorLoading,
                            highlightColor: AppColors.hightlightColorLoading,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: displayHeight(context) * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //list video
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                for (int i = 0; i < 3; i++)
                                  Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Shimmer.fromColors(
                                      baseColor: AppColors.baseColorLoading,
                                      highlightColor:
                                          AppColors.hightlightColorLoading,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors
                                                    .secondaryTextColor),
                                            height: 100,
                                            width: 80,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ],
        ));
  }
}
