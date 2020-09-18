import '../models.dart';

class Video {
  final int videoId;
  final int cvId;
  final int sessionId;
  final String videoUrl;
  final String thumbUrl;
  final double aspectRatio;
  final String coverUrl;
  final StyleVideo videoStyle;

  Video(
      {this.videoId,
      this.cvId,
      this.sessionId,
      this.videoStyle,
      this.aspectRatio,
      this.coverUrl,
      this.thumbUrl,
      this.videoUrl});
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoId: json['videoId'],
      videoUrl: json['videoUrl'] as String ?? "",
      cvId: json['cvId'],
      sessionId: json['sectionId'],
      aspectRatio: json['aspectRatio'],
      thumbUrl: json['thumbUrl'] as String ?? "",
      coverUrl: json['coverUrl'] as String ?? "",
      videoStyle: StyleVideo.fromJson(json['videoStyle']),
    );
  }
}
