/*
 * File: round_update_button.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 4:00:56 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 4:05:58 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */

import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundUpdateButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  const RoundUpdateButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 45,
      width: size.width * .35,
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
                  AppLocalizations.of(context).translate("scr005.btnUpdate"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          onPressed: onPressed),
    );
  }
}
