import 'package:cvideo_employer_mobile/src/models/models.dart';

import '../repositories.dart';

class DetailCVRepository {
  final DetailCVProvider _detailCVProvider;

  DetailCVRepository(this._detailCVProvider);
  Future<ApplicationDetail> fetchCVDetail(
          int postId, int applicationId, String lang) =>
      _detailCVProvider.fetchCVDetail(postId, applicationId, lang);
}
