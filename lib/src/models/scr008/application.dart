import '../models.dart';

class ApplicationDetail {
  int applicationId;
  int postId;
  bool status;
  CVDetail detail;

  ApplicationDetail(
      {this.applicationId, this.postId, this.status, this.detail});

  factory ApplicationDetail.fromJson(Map<String, dynamic> json) {
    return ApplicationDetail(
      applicationId: json['applicationId'],
      status: json["viewed"],
      postId: json["postId"],
      detail: CVDetail.fromJson(json["cv"]),
    );
  }
}
