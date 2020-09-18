import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailBloc extends Bloc<CompanyDetailEevent, CompanyDetailState> {
  CompanyDetailBloc(this.repository) : super(CompanyDetailInitialState());

  final CompanyRepository repository;

  @override
  Stream<CompanyDetailState> mapEventToState(CompanyDetailEevent event) async* {
    final currentState = state;
    if (event is FetchInforCompany) {
      try {
        yield CompanyDetailLoadingState();
        if (currentState is CompanyDetailInitialState) {
          final company = await repository.fetchCompayInfor(event.lang);
          yield CompanyDetailSuccessState(company: company);
          return;
        }
        if (currentState is CompanyDetailSuccessState) {
          final company = await repository.fetchCompayInfor(event.lang);
          yield CompanyDetailSuccessState(company: company);
          return;
        }
      } catch (_) {
        yield CompanyDetailFailedState();
      }
    }
    if (event is UpdateCompanyEvent) {
      try {
        yield CompanyDetailLoadingState();
        final result = await repository.updateCompany(event.company);
        if (result.length > 0) {
          yield UpdateCompanySuccessState(company: event.company);
        } else {
          yield CompanyDetailFailedState();
        }
      } catch (_) {
        yield CompanyDetailFailedState();
      }
    }
  }
}
