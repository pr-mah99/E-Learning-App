import 'question_model.dart';

class Quiz {
  final String quizId;
  final String title;
  final List<Question> questions;

  Quiz({
    required this.quizId,
    required this.title,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<dynamic> questionsJson = json['questions'] ?? [];
    List<Question> quizQuestions = questionsJson.map((q) => Question.fromJson(q)).toList();

    return Quiz(
      quizId: json['quizId'] ?? '',
      title: json['title'] ?? '',
      questions: quizQuestions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'title': title,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}