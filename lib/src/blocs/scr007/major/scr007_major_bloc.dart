/*
 * File: scr007_major_bloc.dart
 * Project: CVideo
 * File Created: Sunday, 19th July 2020 10:11:44 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Sunday, 19th July 2020 10:22:43 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MajorListBloc extends Bloc<MajorListEvent, MajorListState> {
  final PostRepository postRepository;
  MajorListBloc({this.postRepository}) : super(MajorListInitial());
  @override
  void onTransition(Transition<MajorListEvent, MajorListState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<MajorListState> mapEventToState(MajorListEvent event) async* {
    try {
      yield MajorListProcessing();
      if (event is MajorListRequest) {
        final List<Major> listMajor =
            await postRepository.fetchMajorList(event.lang);
        yield MajorListFetchedSuccess(listMajor: listMajor);
      }
    } catch (_) {
      yield MajorListFetchedFailure();
    }
  }
}
