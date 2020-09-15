import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadListCVBloc extends Bloc<LoadListCvApplyEvent, LoadListCVApplyState> {
  final RecruitmentRepository repository;

  LoadListCVBloc(this.repository) : super(LoadListCVApplyInitial());

  @override
  Stream<LoadListCVApplyState> mapEventToState(
      LoadListCvApplyEvent event) async* {
    final currentState = state;
    if (event is FetchInforCvApplyEvent) {
      try {
        if (currentState is LoadListCVApplyInitial) {
          final recruitment =
              await repository.fetchRecruimentById(event.postId);
          final listApplied =
              await repository.fetchListCvDetail(recruitment.postId);
          yield LoadListCVApplySuccess(
              recruitment: recruitment, listApplied: listApplied);
          return;
        }
        if (currentState is LoadListCVApplySuccess) {
          yield LoadListCVApplyLoading();
          final recruitment =
              await repository.fetchRecruimentById(event.postId);
          final listApplied = await repository.fetchListCvDetail(event.postId);
          //need fix
          yield LoadListCVApplySuccess(
              recruitment: recruitment, listApplied: listApplied);
        }
      } catch (_) {
        yield LoadListCVApplyFailed();
      }
    }
  }
}
