import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCvAppliedBloc extends Bloc<ListCvAppliedEvent, ListCvAppliedState> {
  final ListCvRepository repository;

  ListCvAppliedBloc(this.repository) : super(ListCvAppliedInitial());

  @override
  Stream<ListCvAppliedState> mapEventToState(ListCvAppliedEvent event) async* {
    final currentState = state;
    if (event is FetchListCvAppliedCompany) {
      try {
        yield ListCvAppliedLoading();
        if (currentState is ListCvAppliedInitial) {
          final listApplied = await repository.fetchListCvDetail();
          yield ListCvAppliedSuccess(listApplied: listApplied);
          return;
        }
        if (currentState is ListCvAppliedSuccess) {
          yield ListCvAppliedLoading();
          final listApplied = await repository.fetchListCvDetail();
          yield ListCvAppliedSuccess(listApplied: listApplied);
        }
      } catch (_) {
        yield ListCvAppliedFailed();
      }
    }
    yield ListCvAppliedFailed();
  }
}
