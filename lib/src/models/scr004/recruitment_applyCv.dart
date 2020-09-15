import 'package:equatable/equatable.dart';

class RecruitmentApplyCV extends Equatable {
  final int postId;
  final String title;
  final String dueDate;
  final int expectedNumber;
  final String location;
  final bool isApplied;
  final int minSalary;
  final int maxSalary;

  RecruitmentApplyCV(
      {this.postId,
      this.title,
      this.dueDate,
      this.expectedNumber,
      this.location,
      this.isApplied,
      this.minSalary,
      this.maxSalary});

  @override
  List<Object> get props => [this.postId];

  factory RecruitmentApplyCV.fromJson(Map<String, dynamic> json) {
    return RecruitmentApplyCV(
        postId: json['postId'] as int,
        title: json['title'] as String ?? "",
        dueDate: json['dueDate'] as String ?? "",
        expectedNumber: json['expectedNumber'] as int,
        location: json['location'] as String ?? "",
        isApplied: json['isApplied'] as bool,
        minSalary: json['minSalary'] as int,
        maxSalary: json['maxSalary'] as int);
  }
}
