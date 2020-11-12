/*
 * File: scr007_skills_state.dart
 * Project: CVideo
 * File Created: Sunday, 19th July 2020 10:12:12 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Sunday, 19th July 2020 10:18:35 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';

class SkillsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class SkillsListInitial extends SkillsListState {}

class SkillsListProcessing extends SkillsListState {}

class SkillsListFetchedSuccess extends SkillsListState {
  final List<Skills> listSkills;
  SkillsListFetchedSuccess({this.listSkills});

  @override
  List<Object> get props => [listSkills];

  @override
  String toString() => ' List skills success';
}

class SkillsListFetchedFailure extends SkillsListState {
  @override
  String toString() => 'List skills fail';
}
