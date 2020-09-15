import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';

class RecruitmentRepository {
  final Recruitmentrovider _provider;
  const RecruitmentRepository(this._provider);
  Future<RecruitmentApplyCV> fetchRecruimentById(int postId) =>
      _provider.fetchRecruitmentById(postId);
  Future<List<Application>> fetchListCvDetail(int postId) =>
      _provider.fetchEmployeeInfor(postId);
}
