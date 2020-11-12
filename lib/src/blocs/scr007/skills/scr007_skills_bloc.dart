/*
 * File: scr007_skills_bloc.dart
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

class SkillsListBloc extends Bloc<SkillsListEvent, SkillsListState> {
  final PostRepository postRepository;
  SkillsListBloc({this.postRepository}) : super(SkillsListInitial());
  @override
  void onTransition(Transition<SkillsListEvent, SkillsListState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<SkillsListState> mapEventToState(SkillsListEvent event) async* {
    try {
      yield SkillsListProcessing();
      if (event is SkillsListRequest) {
        final List<Skills> listSkills =
            await postRepository.fetchSkillsList(event.lang);
        yield SkillsListFetchedSuccess(listSkills: listSkills);
      }
    } catch (_) {
      yield SkillsListFetchedFailure();
    }
  }
}
