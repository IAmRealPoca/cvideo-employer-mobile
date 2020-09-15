import '../models.dart';

class CvDetail {
  EmployeeDetail employee;
  String created;

  CvDetail({this.employee, this.created});

  factory CvDetail.fromJson(Map<String, dynamic> json) {
    return CvDetail(
      employee: EmployeeDetail.fromJson(json['employee']),
      created: json["created"],
    );
  }
}
