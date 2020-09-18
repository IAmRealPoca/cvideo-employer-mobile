import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs.dart';

class CVDetailBloc extends Bloc<CVDetailEvent, CVDetailState> {
  CVDetailBloc(this.repository) : super(CVDetailInitialState());

  final DetailCVRepository repository;

  @override
  Stream<CVDetailState> mapEventToState(CVDetailEvent event) async* {
    if (event is FetchCVDetail) {
      try {
        yield CVDetailLoadingState();
        final appplicationDetal = await repository.fetchCVDetail(
            event.postId, event.applicationId, event.lang);
        if (appplicationDetal != null) {
          //success
          CVDetail cvDetail = appplicationDetal.detail;
          yield CVDetailLoadSuccessState(cvDetail: cvDetail);
        } else {
          yield CVDetailLoadFailedState();
        }
      } catch (_) {
        yield CVDetailLoadFailedState();
      }
    }
  }
}
