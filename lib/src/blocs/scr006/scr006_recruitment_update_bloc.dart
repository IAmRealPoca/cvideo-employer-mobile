/*
 * File: scr006_recruitment_update_bloc.dart
 * Project: CVideo
 * File Created: Friday, 17th July 2020 8:47:33 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 17th July 2020 8:56:09 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecruitmentPostUpdateBloc
    extends Bloc<RecruitmentPostUpdateEvent, RecruitmentPostUpdateState> {
  final PostRepository postRepository;
  RecruitmentPostUpdateBloc({this.postRepository})
      : super(RecruitmentPostUpdateInitial());

  @override
  void onTransition(
      Transition<RecruitmentPostUpdateEvent, RecruitmentPostUpdateState>
          transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<RecruitmentPostUpdateState> mapEventToState(
      RecruitmentPostUpdateEvent event) async* {
    try {
      yield RecruitmentPostUpdateProcessing();
      if (event is RecruitmentPostUpdateRequest) {
        final String message = await postRepository.updateRecruitmentPostInfo(
            event.postId, event.recruitmentPostInfo);
        if (message == "success") {
          yield RecruitmentPostUpdateSuccess(message: message);
        } else {
          yield RecruitmentPostUpdateFailure();
        }
      }
    } catch (_) {
      yield RecruitmentPostUpdateFailure();
    }
  }
}
