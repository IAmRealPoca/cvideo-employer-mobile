/*
 * File: scr010_recruitment_detail_bloc.dart
 * Project: CVideo
 * File Created: Monday, 22nd June 2020 4:39:48 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Monday, 22nd June 2020 5:06:13 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/models/recruitment_post_detail.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecruitmentDetailBloc
    extends Bloc<RecruitmentDetailEvent, RecruitmentDetailState> {
  final PostRepository postRepository;
  RecruitmentDetailBloc({this.postRepository})
      : super(RecruitmentDetailFetchInitial());
  @override
  void onTransition(
      Transition<RecruitmentDetailEvent, RecruitmentDetailState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<RecruitmentDetailState> mapEventToState(
      RecruitmentDetailEvent event) async* {
    if (event is RecruitmentDetailRequest) {
      try {
        final RecruitmentPostDetail recruitmentPost = await postRepository
            .fetchRecruitmentPostDetail(event.postId, event.lang);
        final List<Major> listMajor =
            await postRepository.fetchMajorList(event.lang);
        yield RecruitmentDetailFetchedSuccess(
            recruitmentDetailPost: recruitmentPost, listMajor: listMajor);
      } catch (_) {
        yield RecruitmentDetailFetchedFailure();
      }
    }
  }
}
