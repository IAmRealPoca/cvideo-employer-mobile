import '../models.dart';

class CVDetail {
  int cvId;
  String title;
  EmployeeDetail employee;
  List<Section> sessions;
  String created;
  Skills skills;

  CVDetail(
      {this.cvId,
      this.title,
      this.employee,
      this.sessions,
      this.created,
      this.skills});

  factory CVDetail.fromJson(Map<String, dynamic> json) {
    List<Section> sections = [];
    var list = json['sections'] as List;
    if (list != null) {
      sections = list.map((i) => Section.fromJson(i)).toList();
    }

    return CVDetail(
        cvId: json['cvId'],
        title: json['title'],
        employee: EmployeeDetail.fromJson(json['employee']),
        created: json["created"],
        sessions: sections
        // skills: Skills.fromJson(json['skills'])
        );
  }
}
