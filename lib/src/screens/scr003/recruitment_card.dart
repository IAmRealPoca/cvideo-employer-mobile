import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/scr004.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RecruitmentCard extends StatelessWidget {
  static const _JOB_TITLE_FONT_SIZE = 18.0;
  static const _ICON_WiDTH = 16.0;
  static const _TITLE_OPACITY = 0.5;

  const RecruitmentCard({
    Key key,
    @required this.recruitmentModel,
  }) : super(key: key);

  final RecruitmentModel recruitmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      child: GestureDetector(
        child: Card(
          margin: EdgeInsets.only(bottom: 12.0),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// First row in the card: Job title
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Tooltip(
                        message: recruitmentModel.title,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          /// Set job title text
                          recruitmentModel.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: _JOB_TITLE_FONT_SIZE,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.0),

                /// Second row in the card: due date
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/screens/scr003/ic_clock.svg",
                      width: _ICON_WiDTH,
                      color: AppColors.primaryTextColor
                          .withOpacity(_TITLE_OPACITY),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      AppLocalizations.of(context).translate("scr003.dueDate"),
                      style: TextStyle(
                        color: AppColors.primaryTextColor
                            .withOpacity(_TITLE_OPACITY),
                      ),
                    ),
                    Text(
                      "${DateFormat('yyyy/MM/dd').format(DateTime.parse(recruitmentModel.dueDate))}",
                      style: TextStyle(
                        color: recruitmentModel.isExpired
                            ? Colors.red[600]
                            : AppColors.primaryTextColor
                                .withOpacity(_TITLE_OPACITY),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6.0),

                /// Thrid row in the card: expected quantity
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/screens/scr003/ic_quantity.svg",
                      width: _ICON_WiDTH,
                      color: AppColors.primaryTextColor
                          .withOpacity(_TITLE_OPACITY),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      /// Set expected candidates text
                      AppLocalizations.of(context)
                              .translate("scr003.expected") +
                          recruitmentModel.expectedCandidates.toString(),
                      style: TextStyle(
                        color: AppColors.primaryTextColor
                            .withOpacity(_TITLE_OPACITY),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),

                /// Fourth row: total cvs and new cvs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    /// Total CVs
                    buildCVQuantitySection(
                      title: AppLocalizations.of(context)
                          .translate("scr003.totalCVs"),

                      /// Set total cvs quantity text
                      quantity: recruitmentModel.totalCVs,
                      quantityColor: AppColors.primaryDarkColor,
                    ),

                    /// New CVs
                    buildCVQuantitySection(
                      title: AppLocalizations.of(context)
                          .translate("scr003.newCVs"),

                      // Set new cvs quantity text
                      quantity: recruitmentModel.newCVs,
                      quantityColor: AppColors.primaryLightColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.SCR004_SCREEN,
              arguments: ScreenArguments(postId: recruitmentModel.id));
        },
      ),
    );
  }

  Container buildCVQuantitySection({
    @required String title,
    @required int quantity,
    @required Color quantityColor,
  }) {
    const _TOTAL_CV_TITLE_FONT_SIZE = 17.0;
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
