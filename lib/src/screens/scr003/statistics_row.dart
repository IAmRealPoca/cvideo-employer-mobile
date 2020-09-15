import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:flutter/material.dart';

class StatisticsRow extends StatelessWidget {
  static const TITLE_FONT_SIZE = 16.0;

  const StatisticsRow({
    Key key,
    @required this.title,
    @required this.quantity,
    @required this.quantityColor,
  }) : super(key: key);

  final String title;
  final int quantity;
  final Color quantityColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        /// Title sectino
        Text(
          /// set title text
          title,
          style: TextStyle(
            fontSize: TITLE_FONT_SIZE,
            color: AppColors.secondaryTextColor,
          ),
        ),

        /// Quanity section
        Text(
          /// Set quantity text
          "$quantity",
          style: TextStyle(
            fontSize: TITLE_FONT_SIZE,
            color: quantityColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
