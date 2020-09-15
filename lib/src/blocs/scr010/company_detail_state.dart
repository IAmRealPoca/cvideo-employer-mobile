import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CompanyDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class CompanyDetailInitialState extends CompanyDetailState {}

class CompanyDetailLoadingState extends CompanyDetailState {}

class CompanyDetailSuccessState extends CompanyDetailState {
  final CompanyDetail company;

  CompanyDetailSuccessState({@required this.company});
}

class UpdateCompanySuccessState extends CompanyDetailState {
  final CompanyDetail company;

  UpdateCompanySuccessState({@required this.company});
}

class CompanyDetailFailedState extends CompanyDetailState {}
