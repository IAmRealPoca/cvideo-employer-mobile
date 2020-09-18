/*
 * File: scr007_post_create_event.dart
 * Project: CVideo
 * File Created: Monday, 20th July 2020 8:52:31 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Monday, 20th July 2020 9:06:54 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';

class RecruitmentPostCreateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RecruitmentPostCreateRequest extends RecruitmentPostCreateEvent {
  final RecruitmentPostInfor recruitmentPostInfo;
  final int companyId;
  RecruitmentPostCreateRequest({this.recruitmentPostInfo, this.companyId});
}
