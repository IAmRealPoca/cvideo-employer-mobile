import 'package:equatable/equatable.dart';

class EmployeeApplied extends Equatable {
  final String fullname;
  final String phone;
  final String email;
  final String address;
  final String avatar;
  final String dateOfBirth;

  EmployeeApplied({
    this.address,
    this.avatar,
    this.dateOfBirth,
    this.email,
    this.fullname,
    this.phone,
  });

  @override
  List<Object> get props => [];

  factory EmployeeApplied.fromJson(Map<String, dynamic> json) {
    //map session to list
    //map employee
    return EmployeeApplied(
      dateOfBirth:
          json['dateOfBirth'] == null ? "" : json['dateOfBirth'].toString(),
      phone: json['phone'] == null ? "" : json['phone'].toString(),
      email: json['email'] == null ? "" : json['email'].toString(),
      address: json['address'] == null ? "" : json['address'].toString(),
      avatar: json['avatar'] == null ? "" : json['avatar'].toString(),
      fullname: json['fullName'] == null ? "" : json['fullName'].toString(),
    );
  }
}
