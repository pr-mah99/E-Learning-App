class Question {
  final String quizId; // Add quizId field
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  int? selectedOption;

  Question({
    required this.quizId, // Include quizId in the constructor
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    this.selectedOption,
  });

  bool get isCorrect {
    return selectedOption != null && selectedOption == correctOptionIndex;
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    List<dynamic> optionsJson = json['options'] ?? [];
    List<String> questionOptions = optionsJson.map((o) => o.toString()).toList();

    return Question(
      quizId: json['quizId'] ?? '', // Extract quizId from JSON
      questionText: json['questionText'] ?? '',
      options: questionOptions,
      correctOptionIndex: json['correctOptionIndex'] ?? 0,
      selectedOption: json['selectedOption'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId, // Include quizId in the JSON output
      'questionText': questionText,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
      'selectedOption': selectedOption,
    };
  }
}
