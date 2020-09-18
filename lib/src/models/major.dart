/*
 * File: major.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 10:09:45 am
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 10:10:00 am
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
class Major {
  final int majorId;
  final String majorName;

  const Major({this.majorId, this.majorName});

  factory Major.fromJson(Map<String, dynamic> json) {
    return Major(
        majorId: json['majorId'] as int,
        majorName: json['majorName'] as String ?? "");
  }
}
