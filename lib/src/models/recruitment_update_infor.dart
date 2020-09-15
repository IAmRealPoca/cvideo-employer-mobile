/*
 * File: recruitment_update_infor.dart
 * Project: CVideo
 * File Created: Friday, 17th July 2020 11:20:18 am
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 17th July 2020 11:21:54 am
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
class RecruitmentPostInfor {
  int postId;
  String title;
  String location;
  int expectedNumber;
  DateTime dueDate;
  String jobDescription;
  String jobRequirement;
  String jobBenefit;
  int majorId;
  int minSalary;
  int maxSalary;

  RecruitmentPostInfor(
      {this.postId,
      this.title,
      this.location,
      this.expectedNumber,
      this.dueDate,
      this.jobDescription,
      this.jobRequirement,
      this.jobBenefit,
      this.majorId,
      this.maxSalary,
      this.minSalary});

  factory RecruitmentPostInfor.fromJson(Map<String, dynamic> json) {
    return RecruitmentPostInfor(
      postId: json['postId'] as int,
      title: json['title'] as String ?? "",
      location: json['location'] as String ?? "",
      expectedNumber: json['expectedNumber'] as int,
      dueDate: DateTime.parse(json['dueDate'].toString()),
      jobDescription: json['jobDescription'] as String ?? "",
      jobRequirement: json['jobRequirement'] as String ?? "",
      jobBenefit: json['jobBenefit'] as String ?? "",
      majorId: json['majorId'] as int,
      maxSalary: json['maxSalary'] as int,
      minSalary: json['minSalary'] as int,
    );
  }
}
