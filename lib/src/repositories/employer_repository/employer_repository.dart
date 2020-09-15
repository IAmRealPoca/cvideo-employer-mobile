import 'package:cvideo_employer_mobile/src/models/recruitment_model.dart';
import 'package:cvideo_employer_mobile/src/models/statistics_model.dart';
import 'package:cvideo_employer_mobile/src/repositories/employer_repository/employer_provider.dart';
import 'package:equatable/equatable.dart';

class EmployerRepository extends Equatable {
  final EmployerProvider employerProvider;

  const EmployerRepository(this.employerProvider);

  @override
  List<Object> get props => [employerProvider];

  Future<StatisticsModel> getStatistics() async {
    return employerProvider.fetchStatistics();
  }

  Future<List<RecruitmentModel>> getRecruitments() async {
    return employerProvider.fetchRecruitments();
  }
}
