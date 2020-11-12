class Skills {
  final int skillsId;
  final String skillsName;

  Skills({this.skillsId, this.skillsName});

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      skillsId: json['skillsId'],
      skillsName: json['skillsName'] as String ?? "",
    );
  }
}
