import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CVDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class CVDetailInitialState extends CVDetailState {}

class CVDetailLoadingState extends CVDetailState {}

class CVDetailLoadSuccessState extends CVDetailState {
  final CVDetail cvDetail;

  CVDetailLoadSuccessState({@required this.cvDetail});
}

class CVDetailLoadFailedState extends CVDetailState {}
