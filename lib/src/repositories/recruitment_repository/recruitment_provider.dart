import 'dart:convert';

import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';

class Recruitmentrovider {
  final successCode = 200;
  AppStorage storage = AppStorage.instance;

  Future<RecruitmentApplyCV> fetchRecruitmentById(int postId) async {
    AppStorage appStorage = AppStorage.instance;
    String token = await appStorage.readSecureApiToken();

    RecruitmentApplyCV recruitment;
    final response = await AppHttpClient.get(
        "/employers/current-employer/recruitment-posts/$postId",
        headers: {"Authorization": "bearer $token"});
    if (successCode != response.statusCode) {
      throw Exception("Failed to loading!");
    }
    recruitment = RecruitmentApplyCV.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));

    return recruitment;
  }

  Future<List<Application>> fetchEmployeeInfor(int postId) async {
    AppStorage appStorage = AppStorage.instance;
    String token = await appStorage.readSecureApiToken();
    List<Application> listApplied;
    final response = await AppHttpClient.get(
        "/employers/current-employer/recruitment-posts/$postId/applied-cvs",
        headers: {"Authorization": "bearer $token"});
    if (successCode != response.statusCode) {
      throw Exception("Failed to loading!");
    }
    final List<dynamic> dataJson = json.decode(utf8.decode(response.bodyBytes));

    listApplied = dataJson.map((e) => Application.fromJson(e)).toList();

    return listApplied;
  }
}
