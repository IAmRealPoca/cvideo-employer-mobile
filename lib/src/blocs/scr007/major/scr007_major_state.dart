/*
 * File: scr007_major_state.dart
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

class MajorListState extends Equatable {
  @override
  List<Object> get props => [];
}

class MajorListInitial extends MajorListState {}

class MajorListProcessing extends MajorListState {}

class MajorListFetchedSuccess extends MajorListState {
  final List<Major> listMajor;
  MajorListFetchedSuccess({this.listMajor});

  @override
  List<Object> get props => [listMajor];

  @override
  String toString() => ' List major success';
}

class MajorListFetchedFailure extends MajorListState {
  @override
  String toString() => 'List major fail';
}
