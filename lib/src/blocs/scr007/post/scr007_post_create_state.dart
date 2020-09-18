/*
 * File: scr007_post_create_state.dart
 * Project: CVideo
 * File Created: Monday, 20th July 2020 8:52:46 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Monday, 20th July 2020 9:14:54 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:equatable/equatable.dart';

class RecruitmentPostCreateState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecruitmentPostCreateInitial extends RecruitmentPostCreateState {}

class RecruitmentPostCreateProcessing extends RecruitmentPostCreateState {}

class RecruitmentPostCreateSuccess extends RecruitmentPostCreateState {
  final String message;
  RecruitmentPostCreateSuccess({this.message});

  @override
  String toString() => ' Create recruitment post success';
}

class RecruitmentPostCreateFailure extends RecruitmentPostCreateState {
  @override
  String toString() => 'Create recruitment post fail';
}
