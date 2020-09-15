/*
 * File: scr007_major_event.dart
 * Project: CVideo
 * File Created: Sunday, 19th July 2020 10:11:56 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Sunday, 19th July 2020 10:16:21 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:equatable/equatable.dart';

class MajorListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MajorListRequest extends MajorListEvent {
  final String lang;
  MajorListRequest({this.lang});
}
