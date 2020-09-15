/*
 * File: scr007_post_create_bloc.dart
 * Project: CVideo
 * File Created: Monday, 20th July 2020 8:52:05 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Monday, 20th July 2020 9:09:01 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecruitmentPostCreateBloc
    extends Bloc<RecruitmentPostCreateEvent, RecruitmentPostCreateState> {
  final PostRepository postRepository;
  RecruitmentPostCreateBloc({this.postRepository})
      : super(RecruitmentPostCreateInitial());
  @override
  void onTransition(
      Transition<RecruitmentPostCreateEvent, RecruitmentPostCreateState>
          transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<RecruitmentPostCreateState> mapEventToState(
      RecruitmentPostCreateEvent event) async* {
    try {
      yield RecruitmentPostCreateProcessing();
      if (event is RecruitmentPostCreateRequest) {
        final String message = await postRepository.createRecruitmentPost(
            event.recruitmentPostInfo, event.companyId);
        if (message == "success") {
          yield RecruitmentPostCreateSuccess(message: message);
        } else {
          yield RecruitmentPostCreateFailure();
        }
      }
    } catch (_) {
      yield RecruitmentPostCreateFailure();
    }
  }
}
