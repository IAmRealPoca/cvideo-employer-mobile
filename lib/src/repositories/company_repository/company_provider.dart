import 'dart:convert';

import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';

class CompanyProvider {
  final successCode = 200;
  AppStorage storage = AppStorage.instance;

  Future<CompanyDetail> fetchCompanyInfor(String lang) async {
    CompanyDetail company;
    Statictis statictis;
    String token = await storage.readSecureApiToken();

    final response = await AppHttpClient.get("/employers/current-employer/info",
        headers: {"Authorization": "bearer $token "});
    if (response.statusCode == successCode) {
      company = CompanyDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cv');
    }
    await Future.delayed(Duration(seconds: 3));
    return company;
  }

  Future<String> updateCompany(CompanyDetail company) async {
    String token = await storage.readSecureApiToken();
    String result = "";
    final response = await AppHttpClient.put(
      "/employers/current-employer/info",
      headers: {
        "Authorization": "bearer $token",
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'companyId': company.companyId,
        'companyName': company.compayName,
        'phone': company.phone,
        'address': company.address,
        'description': company.description,
      }),
    );
    if (response.statusCode == 204) {
      result = "Update successful";
    } else {
      throw Exception("Failed to update!");
    }
    return result;
  }
}
