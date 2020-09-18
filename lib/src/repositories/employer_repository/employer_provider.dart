import 'dart:convert';

import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';

class EmployerProvider {
  static const successCode = 200;

  static final EmployerProvider _instance = EmployerProvider._internal();

  EmployerProvider._internal();

  factory EmployerProvider() {
    return _instance;
  }

  Future<StatisticsModel> fetchStatistics() async {
    String apiToken = await AppStorage.instance.readSecureApiToken();

    final response = await AppHttpClient.get(
        "/employers/current-employer/statistics",
        headers: {"Authorization": "bearer $apiToken"});

    if (response.statusCode != successCode) {
      throw Exception("Failed to loading!");
    }

    final dynamic json = jsonDecode(Utf8Decoder().convert(response.bodyBytes));

    return StatisticsModel.fromJson(json);

    // final response = await rootBundle.loadString("assets/json/statistics.json");
    // dynamic json = jsonDecode(response);
    // return StatisticsModel.fromJson(json);
  }

  Future<List<RecruitmentModel>> fetchRecruitments() async {
    String apiToken = await AppStorage.instance.readSecureApiToken();

    final response = await AppHttpClient.get(
        "/employers/current-employer/recruitment-posts",
        headers: {"Authorization": "bearer $apiToken"});

    if (response.statusCode != successCode) {
      throw Exception("Failed to loading!");
    }

    final List<dynamic> json =
        jsonDecode(Utf8Decoder().convert(response.bodyBytes));

    return json.map((e) => RecruitmentModel.fromJson(e)).toList();
  }
}
