/*
 * File: update_button.dart
 * Project: CVideo
 * File Created: Friday, 17th July 2020 8:43:41 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 17th July 2020 8:43:44 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const UpdateButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .06,
      width: size.width * .3,
      child: RawMaterialButton(
          elevation: 4,
          fillColor: AppColors.primaryColor,
          splashColor: Colors.greenAccent,
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
