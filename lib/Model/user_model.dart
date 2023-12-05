class UserModel {
  final String username;
  final String lectureName;
  final int grade;
  final DateTime date;

  UserModel({
    required this.username,
    required this.lectureName,
    required this.grade,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'lectureName': lectureName,
      'grade': grade,
      'date': date.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      lectureName: json['lectureName'],
      grade: json['grade'],
      date: DateTime.parse(json['date']),
    );
  }
}
