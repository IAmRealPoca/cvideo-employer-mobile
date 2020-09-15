import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecruitmentCardLoading extends StatelessWidget {
  const RecruitmentCardLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 185,
      child: Card(
        margin: EdgeInsets.only(bottom: 12.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Shimmer.fromColors(
            baseColor: AppColors.baseColorLoading,
            highlightColor: AppColors.hightlightColorLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// First row in the card: Job title
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: AppColors.secondaryTextColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 30.0,
                  width: size.width * 0.3,
                ),

                /// Second row in the card: due date
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: AppColors.secondaryTextColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  height: 18.0,
                  width: size.width * 0.7,
                ),

                /// Thrid row in the card: expected quantity
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: AppColors.secondaryTextColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  height: 18.0,
                ),

                /// Fourth row: total cvs and new cvs
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: AppColors.secondaryTextColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 6.0),
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCVQuantitySection({
    @required String title,
    @required int quantity,
    @required Color quantityColor,
  }) {
    const _TOTAL_CV_TITLE_FONT_SIZE = 18.0;
    const _TOTAL_CV_QUANTITY_FONT_SIZE = 17.0;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// CVs title
          Text(
            /// Set title
            title,
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: _TOTAL_CV_TITLE_FONT_SIZE,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            /// Set CV quantity text
            "$quantity",
            style: TextStyle(
              /// Set quantity color text
              color: quantityColor,
              fontSize: _TOTAL_CV_QUANTITY_FONT_SIZE,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
