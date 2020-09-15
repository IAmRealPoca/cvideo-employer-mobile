/*
 * File: scr006_recruitment_update_event.dart
 * Project: CVideo
 * File Created: Friday, 17th July 2020 8:48:19 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 17th July 2020 8:49:33 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';

class RecruitmentPostUpdateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RecruitmentPostUpdateRequest extends RecruitmentPostUpdateEvent {
  final int postId;
  final RecruitmentPostInfor recruitmentPostInfo;
  RecruitmentPostUpdateRequest({this.postId, this.recruitmentPostInfo});
}
