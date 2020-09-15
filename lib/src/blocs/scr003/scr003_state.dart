import 'package:cvideo_employer_mobile/src/models/recruitment_model.dart';
import 'package:cvideo_employer_mobile/src/models/statistics_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SCR003State extends Equatable {
  @override
  List<Object> get props => [];
}

class SCR003StateInitial extends SCR003State {}

class SCR003StateFailure extends SCR003State {}

class SCR003StateLoading extends SCR003State {}

class SCR003StateSuccess extends SCR003State {
  final StatisticsModel statistics;
  final List<RecruitmentModel> listRecruitmentings;
  final List<RecruitmentModel> listExpiredRecruitments;

  SCR003StateSuccess(
      {@required this.statistics,
      @required this.listRecruitmentings,
      @required this.listExpiredRecruitments});

  @override
  List<Object> get props =>
      [this.statistics, this.listRecruitmentings, this.listExpiredRecruitments];
}
