/*
 * File: scr006_recruitment_update_state.dart
 * Project: CVideo
 * File Created: Friday, 17th July 2020 8:47:53 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 17th July 2020 8:52:55 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:equatable/equatable.dart';

class RecruitmentPostUpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecruitmentPostUpdateInitial extends RecruitmentPostUpdateState {}

class RecruitmentPostUpdateProcessing extends RecruitmentPostUpdateState {}

class RecruitmentPostUpdateSuccess extends RecruitmentPostUpdateState {
  final String message;
  RecruitmentPostUpdateSuccess({this.message});

  @override
  String toString() => ' Updated recruitment post information success';
}

class RecruitmentPostUpdateFailure extends RecruitmentPostUpdateState {
  @override
  String toString() => 'Updated recruitment post information fail';
}
