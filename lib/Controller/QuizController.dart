import 'package:app_dev_task/Model/lecture_model.dart';
import 'package:get/get.dart';

import '../Model/question_model.dart';
import '../Model/quiz_model.dart';

class QuizController extends GetxController {
  Rx<Quiz?> quiz = Rx<Quiz?>(null);
  RxInt userScore = 0.obs;
  Lecture? lecture;
  RxBool isLoading = RxBool(true);

  List<Question> get questions => quiz.value?.questions ?? [];
  final RxInt _currentQuestionIndex = 0.obs; // Add this line
  int get currentQuestionIndex => _currentQuestionIndex.value;

  bool isAnswerSelected(int optionIndex) {
    return questions[currentQuestionIndex].selectedOption != null;
  }

  // Assume there is a function to fetch quiz data from any source (API, database, etc.)
  Future<void> fetchQuizData(String quizId) async {
    isLoading.value = true;

    try {
      // Mock data for questions (replace this with your actual data fetching logic)
      List<Question> allQuestions = [
        Question(
          quizId: '0',
          questionText: 'What is Flutter?',
          options: [
            'A programming language',
            'A framework for building UI',
            'A database'
          ],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '0',
          questionText: 'What language is Flutter written in?',
          options: ['Dart', 'Java', 'C++'],
          correctOptionIndex: 0,
        ),
        Question(
          quizId: '0',
          questionText: 'What is Dart?',
          options: ['A bird', 'A programming lnguaage', 'A tool'],
          correctOptionIndex: 1,
        ),
        // Add more questions as needed
        // -----------------
        // -----------------
        // -----------------
        Question(
          quizId: '3',
          questionText: 'ما هو عنوان IP؟',
          options: [
            'عنوان شبكة الكمبيوتر',
            'عنوان جهاز الكمبيوتر',
            'عنوان الشبكة الفرعية'
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '3',
          questionText: 'ما هي شبكة فرعية؟',
          options: [
            'مجموعة من أجهزة الكمبيوتر على شبكة واحدة',
            'جزء من عنوان IP يحدد الشبكة',
            'جزء من عنوان IP يحدد الجهاز'
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '3',
          questionText: 'ما هي قيمة الجزء الأول من عنوان IP؟',
          options: ['شبكة', 'جهاز', 'خادم'],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '3',
          questionText: 'ما هو قناع الشبكة الفرعية؟',
          options: [
            'يحدد عدد أجهزة الكمبيوتر على الشبكة',
            'يحدد جزء من عنوان IP يحدد الشبكة',
            'يحدد جزء من عنوان IP يحدد الجهاز'
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '3',
          questionText:
              'ما هو عدد الأجهزة التي يمكن أن تستوعبها شبكة فرعية بقيمة 255.255.255.0؟',
          options: ['256', '65536', '1048576'],
          correctOptionIndex: 1,
        ),
        // -----------------
        // -----------------
        // -----------------
        Question(
          quizId: '4',
          questionText:
              'ما هو العنصر الأساسي الذي يُستخدم لإنشاء صفحة ويب في HTML؟',
          options: [
            'عنصر div',
            'عنصر body',
            'عنصر html',
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '4',
          questionText: 'ما هي الخاصية التي تُستخدم لتغيير حجم الخط في CSS؟',
          options: [
            'الخاصية font-size',
            'الخاصية font-color',
            'الخاصية font-style',
          ],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '4',
          questionText: 'ما هي الخاصية التي تُستخدم لتغيير لون النص في CSS؟',
          options: [
            'الخاصية font-size',
            'الخاصية font-color',
            'الخاصية font-style',
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '4',
          questionText: 'ما هي الخاصية التي تُستخدم لتغيير تنسيق الخط في CSS؟',
          options: [
            'الخاصية font-size',
            'الخاصية font-color',
            'الخاصية font-style',
          ],
          correctOptionIndex: 3,
        ),
        Question(
          quizId: '4',
          questionText: 'ما هي الخاصية التي تُستخدم لإنشاء قائمة نقطية في CSS؟',
          options: [
            'الخاصية list-style-type',
            'الخاصية list-style-position',
            'الخاصية list-style-image',
          ],
          correctOptionIndex: 1,
        ),

        // -----------------
        // -----------------
        // -----------------

        Question(
          quizId: '5',
          questionText:
              'ما هو حالة النظام التي يُقال فيها إن النظام يمكنه تخصيص جميع الموارد المطلوبة لجميع العمليات دون الدخول في حالة توقف؟',
          options: [
            'حالة آمنة',
            'حالة غير آمنة',
            'حالة توقف',
          ],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '5',
          questionText:
              'ما هو حالة النظام التي يُقال فيها إن النظام لا يمكنه تخصيص جميع الموارد المطلوبة لجميع العمليات دون الدخول في حالة توقف؟',
          options: [
            'حالة آمنة',
            'حالة غير آمنة',
            'حالة توقف',
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '5',
          questionText:
              'ما هي حالة النظام التي لا يمكن فيها لأي عملية إنهاء تنفيذها؟',
          options: [
            'حالة آمنة',
            'حالة غير آمنة',
            'حالة توقف',
          ],
          correctOptionIndex: 3,
        ),
        Question(
          quizId: '5',
          questionText:
              'ما هي تقنية يمكن استخدامها لتجنب حدوث حالة توقف في نظام التشغيل؟',
          options: [
            'تجنب الطلبات المتعارضة',
            'تقسيم الموارد',
            'تأخير الطلبات',
          ],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '5',
          questionText:
              'ما هي تقنية يمكن استخدامها لحل حالة توقف في نظام التشغيل؟',
          options: [
            'تجنب الطلبات المتعارضة',
            'تقسيم الموارد',
            'تأخير الطلبات',
            'قتل عملية',
          ],
          correctOptionIndex: 4,
        ),

        // -----------------
        // -----------------
        // -----------------

        Question(
          quizId: '6',
          questionText: 'ما هي ال view؟',
          options: [
            'مجموعة من البيانات من قاعدة بيانات',
            'عرض لجزء من قاعدة بيانات',
            'الجدول الرئيسي في قاعدة بيانات',
          ],
          correctOptionIndex: 2,
        ),
        Question(
          quizId: '6',
          questionText: 'ما هي الفائدة من استخدام ال view؟',
          options: [
            'تبسيط استعلامات قاعدة البيانات',
            'تقليل تكرار البيانات',
            'تحسين أداء استعلامات قاعدة البيانات',
          ],
          correctOptionIndex: 3,
        ),
        Question(
          quizId: '6',
          questionText: 'ما هي أنواع ال view؟',
          options: [
            'ال view الأساسية',
            'ال view المحسوبة',
            'ال view المحفوظة',
          ],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '6',
          questionText: 'ما هي السمة الرئيسية لل view المحسوبة؟',
          options: [
            'تقوم بإجراء حساب على البيانات',
            'تقوم بإرجاع مجموعة بيانات',
            'تقوم بعرض جزء من قاعدة بيانات',
          ],
          correctOptionIndex: 1,
        ),
        Question(
          quizId: '6',
          questionText: 'ما هي السمة الرئيسية لل view المحفوظة؟',
          options: [
            'يتم تخزينها في قاعدة البيانات',
            'يتم إنشاؤها ديناميكيًا',
            'تقوم بإجراء حساب على البيانات',
          ],
          correctOptionIndex: 1,
        ),

        // -----------------
        // -----------------
        // -----------------

        Question(
          quizId: '7',
          questionText: 'ما هو رمز VB.NET لطباعة "Hello, world!" على الشاشة؟',
          options: [
            'Console.WriteLine("Hello, world!");',
            'Print("Hello, world!");',
            'Write("Hello, world!");',
          ],
          correctOptionIndex: 1,
        ),

        Question(
          quizId: '7',
          questionText:
              'ما هو نوع البيانات الذي يستخدمه VB.NET لتخزين الأرقام الصحيحة؟',
          options: [
            'Integer',
            'Int',
            'Byte',
          ],
          correctOptionIndex: 1,
        ),

        Question(
          quizId: '7',
          questionText:
              'ما هو نوع البيانات الذي يستخدمه VB.NET لتخزين الأرقام العشرية؟',
          options: [
            'Double',
            'Float',
            'Decimal',
          ],
          correctOptionIndex: 3,
        ),

        Question(
          quizId: '7',
          questionText:
              'ما هي الكلمة المفتاحية المستخدمة لإنشاء متغير في VB.NET؟',
          options: [
            'Dim',
            'Let',
            'Var',
          ],
          correctOptionIndex: 1,
        ),

        Question(
          quizId: '7',
          questionText:
              'ما هي الكلمة المفتاحية المستخدمة لإنشاء بنية شرطية في VB.NET؟',
          options: [
            'If',
            'Else',
            'ElseIf',
          ],
          correctOptionIndex: 1,
        ),

        // -----------------
        // -----------------
        // -----------------

        Question(
          quizId: "8",
          questionText:
              "ما هي الكلمة الأساسية المستخدمة لإنشاء دالة في برولوك؟",
          options: ["def", "class", "module", "end"],
          correctOptionIndex: 0,
        ),
        Question(
          quizId: "8",
          questionText:
              "ما هي الطريقة الأساسية المستخدمة لطباعة النص في برولوك؟",
          options: ["puts", "print", "printf", "eputs"],
          correctOptionIndex: 0,
        ),
        Question(
          quizId: "8",
          questionText: "ما هي طريقة الوصول إلى قيمة متغير في برولوك؟",
          options: [
            "@variable_name",
            "\$variable_name",
            "#variable_name",
            "\$variable_name"
          ],
          correctOptionIndex: 0,
        ),
        Question(
          quizId: "8",
          questionText: "ما هي طريقة إنشاء مصفوفة في برولوك؟",
          options: [
            "array = [1, 2, 3]",
            "array = new Array(1, 2, 3)",
            "array = Array.new(1, 2, 3)",
            "array = [1, 2, 3].to_a"
          ],
          correctOptionIndex: 0,
        ),
        Question(
          quizId: "8",
          questionText: "ما هي طريقة إنشاء حلقة for في برولوك؟",
          options: [
            "for i in 0..10 do",
            "for i in range(0, 10)",
            "for i = 0; i < 10; i++",
            "for i in 0..10:"
          ],
          correctOptionIndex: 0,
        ),
      ];

      // Filter questions based on the provided quizId
      List<Question> filteredQuestions =
          allQuestions.where((question) => question.quizId == quizId).toList();

      // Create a Quiz object with the filtered questions
      quiz.value = Quiz(
          quizId: quizId,
          title: 'Sample Quiz $quizId',
          questions: filteredQuestions);

      // Initialize the question index to 0 when new quiz data is fetched
      _currentQuestionIndex.value = 0;
    } catch (error) {
      // Handle error if needed
      // print('Error fetching quiz data: $error');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void selectAnswer(int questionIndex, int selectedOption) {
    print('Selecting answer for question $questionIndex: $selectedOption');
    questions[questionIndex].selectedOption = selectedOption;
    userScore.value = questions.where((q) => q.isCorrect).length;
    print('userScore.value=${userScore.value}');
    update(); // ← rebuilds any GetBuilder<TabX> widget
  }

  void nextQuestion(int i) {
    if (isAnswerSelected(i)) {
      // إذا قام المستخدم بالاختيار، قم بتحديث الإجابة
      if (_currentQuestionIndex.value < questions.length - 1) {
        _currentQuestionIndex.value++;
        update(); // Trigger UI update
      } else {
        // userScore.value = questions.where((q) => q.isCorrect).length;
        // print('userScore.value=${userScore.value}');
        // update(); // Trigger UI update
        // Get.offAllNamed('/result', arguments: [userScore.value,lecture]);
        Get.offAllNamed('/result',
            arguments: {'lecture': lecture, 'userScore': userScore.value});
      }
    } else {
      // إذا لم يقم المستخدم بالاختيار، قم بعرض رسالة تنبيه
      Get.snackbar('تحذير', 'يرجى اختيار إجابة قبل المتابعة.');
    }
  }

  bool get isLastQuestion =>
      _currentQuestionIndex.value == questions.length - 1;
}
