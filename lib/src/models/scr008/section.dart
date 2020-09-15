import '../models.dart';

class Section {
  final int sessionId;
  final String sessionTitle;
  final String sessionText;
  final List<Field> sessionField;
  final List<Video> sessionVideo;
  final String icon;
  final int sectionTypeId;
  final int displayOrder;

  Section(
      {this.sessionText,
      this.sessionField,
      this.sessionId,
      this.sessionTitle,
      this.icon,
      this.sectionTypeId,
      this.sessionVideo,
      this.displayOrder});

  factory Section.fromJson(Map<String, dynamic> json) {
    //map field to list
    List<Field> fields = [];
    var list = json['fields'] as List;
    fields = list.map((i) => Field.fromJson(i)).toList();

    List<Video> videos = [];
    var listVideo = json['videos'] as List;
    videos = listVideo.map((e) => Video.fromJson(e)).toList();

    return Section(
      sessionId: json['sectionId'],
      sessionTitle: json['title'] == null ? "" : json['title'].toString(),
      sessionText: json['text'] == null ? "" : json['text'].toString(),
      icon: json['icon'] == null ? "" : json['icon'].toString(),
      sessionField: fields,
      sectionTypeId: json['sectionTypeId'],
      sessionVideo: videos,
    );
  }
}
