import 'dart:convert';

import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';

class DetailCVProvider {
  final successCode = 200;
  AppStorage storage = AppStorage.instance;

  Future<ApplicationDetail> fetchCVDetail(
      int postId, int applicationId, String lang) async {
    ApplicationDetail detail;
    String token = await storage.readSecureApiToken();

    final response = await AppHttpClient.get(
        "/employers/current-employer/recruitment-posts/$postId/applied-cvs/$applicationId",
        headers: {"Authorization": "bearer $token "});
    if (response.statusCode == successCode) {
      detail = ApplicationDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cv');
    }
    print(response.body);
    await Future.delayed(Duration(seconds: 3));
    return detail;
  }
}
