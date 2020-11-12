/*
 * File: home_provider.dart
 * Project: CVideo
 * File Created: Friday, 12th June 2020 8:07:55 am
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 12th June 2020 9:24:53 am
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'dart:async';
import 'dart:convert';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/models/recruitment_post_detail.dart';

class PostProvider {
  final successCode = 200;
  // Fetch list recruitment post detail according to postId
  Future<RecruitmentPostDetail> fetchRecruitmentPostDetail(
      int postId, String lang) async {
    RecruitmentPostDetail recruitmentPostDetail;
    final response =
        await AppHttpClient.get("/recruitment-posts/$postId?lang=$lang")
            .then((response) {
      if (successCode != response.statusCode) {
        throw Exception("Failed to loading!");
      }
      final dataJson = json.decode(utf8.decode(response.bodyBytes));
      recruitmentPostDetail = RecruitmentPostDetail.fromJson(dataJson);
      return recruitmentPostDetail;
    }).catchError((error) {
      print("Errorrrrrrr : $error");
    });
    return recruitmentPostDetail;
  }

  Future<List<Skills>> fetchSkillsList(String lang) async {
    AppStorage appStorage = AppStorage.instance;
    String token = await appStorage.readSecureApiToken();
    List<Skills> listSkills;
    final response = await AppHttpClient.get("/skillss?lang=$lang",
        headers: {"Authorization": "bearer $token"});
    if (successCode != response.statusCode) {
      throw Exception("Failed to loading!");
    }
    final List<dynamic> dataJson = json.decode(utf8.decode(response.bodyBytes));

    listSkills = dataJson.map((e) => Skills.fromJson(e)).toList();
    return listSkills;
  }

  Future<String> updateRecruitmentPostInfo(
      int postId, RecruitmentPostInfor recruitmentPostInfor) async {
    AppStorage appStorage = AppStorage.instance;
    String token = await appStorage.readSecureApiToken();
    String result = "";
    final response = await AppHttpClient.put(
      "/recruitment-posts/$postId",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer $token"
      },
      body: jsonEncode({
        'postId': recruitmentPostInfor.postId,
        'title': recruitmentPostInfor.title,
        'location': recruitmentPostInfor.location,
        'expectedNumber': recruitmentPostInfor.expectedNumber,
        'dueDate': recruitmentPostInfor.dueDate.toIso8601String(),
        'jobDescription': recruitmentPostInfor.jobDescription,
        'jobRequirement': recruitmentPostInfor.jobRequirement,
        'jobBenefit': recruitmentPostInfor.jobBenefit,
        'skillsId': recruitmentPostInfor.skillsId,
        'minSalary': recruitmentPostInfor.minSalary,
        'maxSalary': recruitmentPostInfor.maxSalary,
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 204) {
      return "success";
    } else {
      print("-----Status code: " + response.statusCode.toString());
    }
    return result;
  }

  Future<String> createRecruitmentPost(
      RecruitmentPostInfor recruitmentPostInfor, int companyId) async {
    AppStorage appStorage = AppStorage.instance;
    String token = await appStorage.readSecureApiToken();
    String result = "";
    final response = await AppHttpClient.post(
      "/recruitment-posts",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer $token"
      },
      body: jsonEncode({
        'companyId': companyId,
        'title': recruitmentPostInfor.title,
        'location': recruitmentPostInfor.location,
        'expectedNumber': recruitmentPostInfor.expectedNumber,
        'dueDate': recruitmentPostInfor.dueDate.toIso8601String(),
        'jobDescription': recruitmentPostInfor.jobDescription,
        'jobRequirement': recruitmentPostInfor.jobRequirement,
        'jobBenefit': recruitmentPostInfor.jobBenefit,
        'skillsId': recruitmentPostInfor.skillsId,
        'minSalary': recruitmentPostInfor.minSalary,
        'maxSalary': recruitmentPostInfor.maxSalary,
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 204) {
      return "success";
    } else {
      print("-----Status code: " + response.statusCode.toString());
    }
    return result;
  }
}
