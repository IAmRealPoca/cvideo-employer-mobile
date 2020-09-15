class Major {
  final int majorId;
  final String majorName;

  Major({this.majorId, this.majorName});

  factory Major.fromJson(Map<String, dynamic> json) {
    return Major(
      majorId: json['majorId'],
      majorName: json['majorName'] as String ?? "",
    );
  }
}
