class StyleVideo {
  final int styleId;
  final String styleName;

  StyleVideo({this.styleId, this.styleName});

  factory StyleVideo.fromJson(Map<String, dynamic> json) {
    return StyleVideo(
      styleId: json['styleId'],
      styleName: json['styleName'],
    );
  }
}
