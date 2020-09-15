import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LoadListCvApplyEvent extends Equatable {
  const LoadListCvApplyEvent();

  @override
  List<Object> get props => [];
}

class FetchInforCvApplyEvent extends LoadListCvApplyEvent {
  final int postId;

  FetchInforCvApplyEvent({@required this.postId});
}
