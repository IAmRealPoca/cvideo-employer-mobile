/*
 * File: scr005_recruitment_detail_state.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 4:08:42 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 4:12:15 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */

import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/models/recruitment_post_detail.dart';
import 'package:equatable/equatable.dart';

class RecruitmentDetailState extends Equatable {
  const RecruitmentDetailState();

  @override
  List<Object> get props => [];
}

class RecruitmentDetailFetchInitial extends RecruitmentDetailState {}

class RecruitmentDetailFetching extends RecruitmentDetailState {}

class RecruitmentDetailFetchedSuccess extends RecruitmentDetailState {
  final RecruitmentPostDetail recruitmentDetailPost;
  final List<Major> listMajor;
  RecruitmentDetailFetchedSuccess({this.recruitmentDetailPost, this.listMajor});

  @override
  List<Object> get props => [recruitmentDetailPost, listMajor];
  @override
  String toString() => ' Recruitment post load success';
}

class RecruitmentDetailFetchedFailure extends RecruitmentDetailState {
  @override
  String toString() => ' Recruitment post load fail';
}
