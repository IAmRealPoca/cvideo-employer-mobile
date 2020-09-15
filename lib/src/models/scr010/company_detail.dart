class CompanyDetail {
  final int companyId;
  final String compayName;
  final String address;
  final String phone;
  final String avatar;
  final String email;
  final String description;

  CompanyDetail(
      {this.companyId,
      this.compayName,
      this.address,
      this.phone,
      this.avatar,
      this.description,
      this.email});
  factory CompanyDetail.fromJson(Map<String, dynamic> json) {
    return CompanyDetail(
      companyId: json['id'],
      compayName: json['name'] == null ? "" : json['name'].toString(),
      address: json['address'] == null ? "" : json['address'].toString(),
      phone: json['phone'] == null ? "" : json['phone'].toString(),
      avatar: json['avatar'] == null ? "" : json['avatar'].toString(),
      email: json['email'] == null ? "" : json['email'].toString(),
      description:
          json['description'] == null ? "" : json['description'].toString(),
    );
  }
}
