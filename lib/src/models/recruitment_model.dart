import 'package:equatable/equatable.dart';

class RecruitmentModel extends Equatable {
  final int id;
  final String title;
  final String dueDate;
  final int expectedCandidates;
  final int totalCVs;
  final int newCVs;
  final bool isExpired;

  RecruitmentModel({
    this.id,
    this.title,
    this.dueDate,
    this.expectedCandidates,
    this.totalCVs,
    this.newCVs,
    this.isExpired = false,
  });

  @override
  List<Object> get props => [this.id];

  RecruitmentModel copyWith({
    int id,
    String title,
    String dueDate,
    int expectedCandidates,
    int totalCVs,
    int newCVs,
    bool isExpired,
  }) {
    return RecruitmentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      expectedCandidates: expectedCandidates ?? this.expectedCandidates,
      totalCVs: totalCVs ?? this.totalCVs,
      newCVs: newCVs ?? this.newCVs,
      isExpired: isExpired ?? this.isExpired,
    );
  }

  static RecruitmentModel fromJson(dynamic json) {
    return RecruitmentModel(
      id: json["postId"] as int,
      title: json["title"] as String,
      dueDate: json["dueDate"] as String,
      expectedCandidates: json["expectedNumber"] as int,
      totalCVs: json["totalCVs"] as int,
      newCVs: json["newCVs"] as int,
    );
  }
}
