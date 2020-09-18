import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class LoadListCVApplyState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadListCVApplyInitial extends LoadListCVApplyState {}

class LoadListCVApplyLoading extends LoadListCVApplyState {}

class LoadListCVApplySuccess extends LoadListCVApplyState {
  final RecruitmentApplyCV recruitment;
  final List<Application> listApplied;

  LoadListCVApplySuccess({this.recruitment, this.listApplied});
  LoadListCVApplySuccess copyWith(
      {RecruitmentApplyCV recruitment, Application listApplied}) {
    return LoadListCVApplySuccess(
        recruitment: recruitment ?? this.recruitment,
        listApplied: listApplied ?? this.listApplied);
  }
}

class LoadListCVApplyFailed extends LoadListCVApplyState {}
