import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';

class CompanyDetailEevent extends Equatable {
  const CompanyDetailEevent();
  @override
  List<Object> get props => [];
}

class FetchInforCompany extends CompanyDetailEevent {
  final String lang;

  FetchInforCompany({this.lang});
}

class UpdateCompanyEvent extends CompanyDetailEevent {
  final CompanyDetail company;

  UpdateCompanyEvent({this.company});
}
