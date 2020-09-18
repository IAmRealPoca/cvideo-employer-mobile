/*
 * File: recruitment_post_detail.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 10:08:09 am
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 10:11:30 am
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'models.dart';

class RecruitmentPostDetail {
  int postId;
  Company company;
  String location;
  int expectedNumber;
  String duteDate;
  String title;
  String jobDescription;
  String jobRequirement;
  String jobBenefit;
  Major major;
  int minSalary;
  int maxSalary;
  String created;
  bool isApplied;

  RecruitmentPostDetail(
      {this.postId,
      this.company,
      this.location,
      this.expectedNumber,
      this.duteDate,
      this.title,
      this.jobDescription,
      this.jobRequirement,
      this.jobBenefit,
      this.major,
      this.minSalary,
      this.maxSalary,
      this.isApplied,
      this.created});

  factory RecruitmentPostDetail.fromJson(Map<String, dynamic> json) {
    dynamic company = json['company'];
    Company companyRecruitment = Company.fromJson(company);

    dynamic major = json['major'];
    Major majorRecruitment = Major.fromJson(major);
    return RecruitmentPostDetail(
        postId: json['postId'] as int,
        company: companyRecruitment,
        location: json['location'] as String ?? "",
        expectedNumber: json['expectedNumber'] as int,
        duteDate: json['dueDate'] as String ?? "",
        title: json['title'] as String ?? "",
        jobDescription: json['jobDescription'] as String ?? "",
        jobRequirement: json['jobRequirement'] as String ?? "",
        jobBenefit: json['jobBenefit'] as String ?? "",
        major: majorRecruitment,
        minSalary: json['minSalary'] as int,
        maxSalary: json['maxSalary'] as int,
        isApplied: json['isApplied'] as bool,
        created: json['created'] as String ?? "");
  }
}
