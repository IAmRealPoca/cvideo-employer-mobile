import 'package:cvideo_employer_mobile/src/models/models.dart';

class Application {
  int applicationId;
  int postId;
  bool status;
  CvDetailApplied detail;

  Application({this.applicationId, this.postId, this.status, this.detail});

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationId: json['applicationId'],
      status: json["viewed"],
      postId: json["postId"],
      detail: CvDetailApplied.fromJson(json["cv"]),
    );
  }
}
