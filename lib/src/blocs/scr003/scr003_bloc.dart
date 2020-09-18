import 'package:cvideo_employer_mobile/src/models/recruitment_model.dart';
import 'package:cvideo_employer_mobile/src/models/statistics_model.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scr003_blocs_barrel.dart';

class SCR003Bloc extends Bloc<SCR003Event, SCR003State> {
  SCR003Bloc(this.employerRepository) : super(SCR003StateInitial());

  final EmployerRepository employerRepository;

  @override
  Stream<SCR003State> mapEventToState(SCR003Event event) async* {
    if (event is SCR003EventLoad) {
      yield* _mapSCR003EventLoadToState();
    }
  }

  Stream<SCR003State> _mapSCR003EventLoadToState() async* {
    try {
      yield SCR003StateLoading();

      final StatisticsModel statistics =
          await employerRepository.getStatistics();
      final List<RecruitmentModel> listRecruitments =
          await employerRepository.getRecruitments();

      DateTime now = DateTime.now().toUtc();

      final listRecruitmentings = listRecruitments
          .where((element) =>
              !DateTime.parse(element.dueDate).toUtc().isBefore(now))
          .toList();

      final listExpiredRecruitments = listRecruitments
          .where((element) =>
              DateTime.parse(element.dueDate).toUtc().isBefore(now))
          .toList();

      yield SCR003StateSuccess(
        statistics: statistics,
        listRecruitmentings: listRecruitmentings,
        listExpiredRecruitments: listExpiredRecruitments,
      );
    } catch (e) {
      yield SCR003StateFailure();
    }
  }
}
