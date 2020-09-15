import 'package:equatable/equatable.dart';

class CVDetailEvent extends Equatable {
  const CVDetailEvent();
  @override
  List<Object> get props => [];
}

class FetchCVDetail extends CVDetailEvent {
  final String lang;
  final int postId;
  final int applicationId;

  FetchCVDetail({this.lang, this.applicationId, this.postId});
}
