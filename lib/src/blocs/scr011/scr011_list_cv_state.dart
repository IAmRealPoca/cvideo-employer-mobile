import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ListCvAppliedState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListCvAppliedInitial extends ListCvAppliedState {}

class ListCvAppliedLoading extends ListCvAppliedState {}

class ListCvAppliedSuccess extends ListCvAppliedState {
  final List<Application> listApplied;

  ListCvAppliedSuccess({this.listApplied});
  ListCvAppliedSuccess copyWith({Application listApplied}) {
    return ListCvAppliedSuccess(listApplied: listApplied ?? this.listApplied);
  }
}

class ListCvAppliedFailed extends ListCvAppliedState {}
