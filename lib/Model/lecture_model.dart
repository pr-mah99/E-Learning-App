class Lecture {
  final String title;
  final String subTitle;
  final String thumbnail;
  final String duration;
  final String videoUrl;
  final String description;
  final DateTime addedDate;
  final String channelName;
  final int views;
  final String quizId; // إضافة معرف الاختبار

  Lecture({
    required this.title,
    required this.subTitle,
    required this.thumbnail,
    required this.duration,
    required this.videoUrl,
    required this.description,
    required this.addedDate,
    required this.channelName,
    required this.views,
    required this.quizId,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      duration: json['duration'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      description: json['description'] ?? '',
      addedDate: DateTime.parse(json['addedDate'] ?? ''),
      channelName: json['channelName'] ?? '',
      views: json['views'] ?? 0,
      quizId: json['quizId'] ?? '', // استخدام معرف الاختبار من JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'thumbnail': thumbnail,
      'duration': duration,
      'videoUrl': videoUrl,
      'description': description,
      'addedDate': addedDate.toIso8601String(),
      'channelName': channelName,
      'views': views,
      'quizId': quizId, // إضافة معرف الاختبار
    };
  }
}
