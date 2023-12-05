import 'package:app_dev_task/Model/lecture_model.dart';
import 'package:app_dev_task/Services/Constant/constant.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/QuizController.dart';
import '../../Controller/userController.dart';
import '../../Model/user_model.dart';

class resultScreen extends StatefulWidget {
  const resultScreen({super.key});

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  final QuizController quizController = Get.put(QuizController());
  final UserController userController = Get.put(UserController());
  // final UserController userController = Get.find<UserController>();
  late ConfettiController _topController;

  late int userScore;
  var lecture;

  @override
  void initState() {
    _topController = ConfettiController(duration: const Duration(seconds: 3));
    super.initState();
    // ----------
    userScore = Get.arguments['userScore'];
    lecture = Get.arguments['lecture'];
    // ------------
    if (userScore != 0) {
      _topController.play();
    }
    // ----------
    saveResult();
  }

  void saveResult() {
    var le = Get.arguments['lecture'] as Lecture;
    final UserModel user = UserModel(
      username: userName.toString(),
      lectureName: le.title,
      grade: userScore,
      date: DateTime.now(),
    );
    userController.saveUser(user);
  }

  @override
  void dispose() {
    // dispose the controller
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var le = Get.arguments['lecture'] as Lecture;
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text('النتيجة النهائية'),
          ),
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        _topController.play();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          userName!,
                          style: const TextStyle(fontSize: 35),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Your Score: ${userScore.toString()}'),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/top", arguments: {'lecture': le.title});
                    },
                    child: const Text('عرض كل النتائج'),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 88.0),
                    child: Divider(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/quiz', arguments: lecture);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.refresh_thick,
                            size: 90,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('أعادة الامتحان'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 88.0),
                    child: Divider(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('العودة الى القائمة الرئيسية'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _topController,
            blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
            maxBlastForce: 5,
            minBlastForce: 1,
            emissionFrequency: 0.50,
            // 10 paticles will pop-up at a time
            numberOfParticles: 20,
            // particles will come down
            gravity: 1,
            shouldLoop: false,
          ),
        ), //تاثير الاحتفال
      ],
    );
  }
}
