import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'statistics_row.dart';

class StatisticsSection extends StatelessWidget {
  static const _CONTAINTER_HEIGHT = 220.0;

  const StatisticsSection({
    Key key,
    @required this.statisticsModel,
  }) : super(key: key);

  final StatisticsModel statisticsModel;

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
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.0),

            /// Company name
            Row(
              children: <Widget>[
                Text(
                  /// Set company name
                  statisticsModel.companyName,
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            /// Statistics title section
            Row(
              children: <Widget>[
                Text(
                  /// Set title text
                  AppLocalizations.of(context)
                      .translate("scr003.statisticsTitle"),
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: 4.0),

            /// Total candidates section
            StatisticsRow(
              /// Set total candidates text
              title: AppLocalizations.of(context)
                  .translate("scr003.totalCandidates"),
              quantity: statisticsModel.totalCandidates,
              quantityColor: Hexcolor("#0F117A"),
            ),
            SizedBox(height: 6.0),

            /// Last month candidates section
            StatisticsRow(
              /// Set last month candidates text
              title: AppLocalizations.of(context)
                  .translate("scr003.lastMonthCandidates"),
              quantity: statisticsModel.lastMonthCandidates,
              quantityColor: Hexcolor("#12E2A3"),
            ),
            SizedBox(height: 6.0),

            /// Today candidates section
            StatisticsRow(
              /// Set today candidates text
              title: AppLocalizations.of(context)
                  .translate("scr003.todayCandidates"),
              quantity: statisticsModel.todayCandidates,
              quantityColor: Hexcolor("#FACF5A"),
            ),
            SizedBox(height: 6.0),

            /// Total recuitment post section
            StatisticsRow(
              /// Set total recruitment posts text
              title: AppLocalizations.of(context)
                  .translate("scr003.totalRecruitments"),
              quantity: statisticsModel.totalRecruitments,
              quantityColor: Hexcolor("#ffaf4f"),
            ),
          ],
        ),
      ),
    );
  }
}
