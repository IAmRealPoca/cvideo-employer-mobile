import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ListCvAppliedEvent extends Equatable {
  const ListCvAppliedEvent();

  @override
  List<Object> get props => [];
}

class FetchListCvAppliedCompany extends ListCvAppliedEvent {
  final int companyId;

  FetchListCvAppliedCompany({@required this.companyId});
}
