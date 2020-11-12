/*
 * File: skills.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 10:09:45 am
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 10:10:00 am
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
class Skills {
  final int skillsId;
  final String skillsName;

  const Skills({this.skillsId, this.skillsName});

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
        skillsId: json['skillsId'] as int,
        skillsName: json['skillsName'] as String ?? "");
  }
}
