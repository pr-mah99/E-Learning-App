import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/QuizController.dart';
import '../../Model/lecture_model.dart';
import '../../Model/question_model.dart';
import '../../Model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Lecture lecture = Get.arguments as Lecture;
  final QuizController quizController = Get.put(QuizController());

  @override
  void initState() {
    super.initState();
    // print('Get.arguments==lecture ${Get.arguments==lecture}');
    quizController.lecture=Get.arguments as Lecture;
    quizController.fetchQuizData(lecture.quizId);
  }

  @override
  Widget build(BuildContext context) {
    // print('quizController.quiz.value.toString()=${quizController.quiz.value.toString()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz for ${lecture.title}'),
      ),
      body: Obx(() {
        if (quizController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (quizController.quiz.value!.questions.isEmpty) {
          return const Center(
            child: Text('لا يوجد امتحان في الوقت الحالي'),
          );
        } else {
          return QuizWidget(quiz: quizController.quiz.value!);
        }
      }),
    );
  }
}

class QuizWidget extends StatelessWidget {
  final Quiz quiz;

  const QuizWidget({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuizController>();
    return Obx(() {
      final question = controller.questions[controller.currentQuestionIndex];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz: ${quiz.title}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              QuestionWidget(
                question: question,
                onAnswerSelected: (selectedOption) {
                  controller.selectAnswer(controller.currentQuestionIndex, selectedOption);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Move to the next question
                  controller.nextQuestion(controller.currentQuestionIndex);
                },
                child: Text(!controller.isLastQuestion ? 'التالي' : 'النتيجة'),
              ),
            ],
          ),
        ],
      );
    });
  }
}


// QuestionWidget.dart
class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(int) onAnswerSelected;

  const QuestionWidget({Key? key, required this.question, required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.questionText,
            style: const TextStyle(fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Divider(),
          ),
          GetBuilder<QuizController>(
            builder: (quizController) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < question.options.length; i++)
                  GestureDetector(
                    onTap: () {
                      onAnswerSelected(i);
                      // print('Answer selected: questionIndex=${quizController.currentQuestionIndex}, selectedOption=$i');
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                question.selectedOption == i ? Colors.pinkAccent.withOpacity(0.8) : Colors.grey.withOpacity(0.4),
                                question.selectedOption == i ? Colors.pinkAccent.withOpacity(0.6) : Colors.grey.withOpacity(0.5),
                              ]
                          ),
                      borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        question.options[i],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                const Divider(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


