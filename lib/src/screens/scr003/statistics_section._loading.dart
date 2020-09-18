import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StatisticsSectionLoading extends StatelessWidget {
  static const _CONTAINTER_HEIGHT = 220.0;

  const StatisticsSectionLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      width: size.width,
      height: _CONTAINTER_HEIGHT,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Shimmer.fromColors(
          baseColor: AppColors.baseColorLoading,
          highlightColor: AppColors.hightlightColorLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Company name
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: AppColors.secondaryTextColor,
                ),
                margin: EdgeInsets.only(top: 20.0, bottom: 6.0),
                height: 30.0,
                width: size.width * 0.6,
              ),

              /// Statistics title section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: AppColors.secondaryTextColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 6.0),
                height: 25.0,
                width: size.width * 0.4,
              ),

              /// Total candidates section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: AppColors.secondaryTextColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 6.0),
                height: 18.0,
              ),

              /// Last month candidates section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: AppColors.secondaryTextColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 6.0),
                height: 18.0,
              ),

              /// Today candidates section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: AppColors.secondaryTextColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 6.0),
                height: 18.0,
              ),

              /// Total recuitment posts section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: AppColors.secondaryTextColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 6.0),
                height: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
