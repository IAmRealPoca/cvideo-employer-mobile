import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StatisticsModel extends Equatable {
  final int companyId;
  final String companyName;
  final int totalCandidates;
  final int lastMonthCandidates;
  final int todayCandidates;
  final int totalRecruitments;

  StatisticsModel({
    @required this.companyId,
    @required this.companyName,
    @required this.totalCandidates,
    @required this.lastMonthCandidates,
    @required this.todayCandidates,
    @required this.totalRecruitments,
  });

  @override
  List<Object> get props => [this.companyId];

  static StatisticsModel fromJson(dynamic json) {
    return StatisticsModel(
        companyId: json['company']['id'] as int,
        companyName: json['company']['name'] as String,
        totalCandidates: json['totalCandidates'] as int,
        lastMonthCandidates: json['lastMonthCandidates'] as int,
        todayCandidates: json['todayCandidates'] as int,
        totalRecruitments: json['totalRecruitmentPosts'] as int);
  }
}
