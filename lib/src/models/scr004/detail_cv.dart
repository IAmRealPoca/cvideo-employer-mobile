import '../models.dart';
import 'employee_applied.dart';

class CvDetailApplied {
  EmployeeApplied employee;
  String created;

  CvDetailApplied({this.employee, this.created});

  factory CvDetailApplied.fromJson(Map<String, dynamic> json) {
    return CvDetailApplied(
      employee: EmployeeApplied.fromJson(json['employee']),
      created: json["created"],
    );
  }
}
