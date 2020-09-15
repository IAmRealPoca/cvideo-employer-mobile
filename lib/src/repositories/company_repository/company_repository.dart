import 'package:cvideo_employer_mobile/src/models/models.dart';

import '../repositories.dart';

class CompanyRepository {
  final CompanyProvider _provider;

  CompanyRepository(this._provider);
  Future<CompanyDetail> fetchCompayInfor(String lang) =>
      _provider.fetchCompanyInfor(lang);
  Future<String> updateCompany(CompanyDetail company) =>
      _provider.updateCompany(company);
}
