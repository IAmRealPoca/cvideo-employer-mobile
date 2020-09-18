import '../models.dart';

class Statictis {
  final Company company;
  final int totalCandidate;
  final int lastMonthCandidate;
  final int todayCandidate;
  final int recruitmentPost;

  Statictis(
      {this.company,
      this.totalCandidate,
      this.lastMonthCandidate,
      this.todayCandidate,
      this.recruitmentPost});

  factory Statictis.fromJson(Map<String, dynamic> json) {
    return Statictis(
      totalCandidate: json['totalCandidates'],
      lastMonthCandidate: json["lastMonthCandidates"],
      todayCandidate: json["todayCandidates"],
      recruitmentPost: json["totalRecruitmentPosts"],
      company: Company.fromJson(json["company"]),
    );
  }
}
