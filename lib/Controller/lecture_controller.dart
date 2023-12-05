import 'package:get/get.dart';
import '../Model/lecture_model.dart';

class LectureController extends GetxController {
  RxList<Lecture> lectures = <Lecture>[].obs;
  RxBool isLoading = true.obs; // إضافة isLoading

  void fetchLectures() async {
    isLoading.value = true; // قم بتعيين isLoading إلى true قبل بدء التحميل

    await Future.delayed(const Duration(milliseconds: 500)); // لتمثيل عملية التحميل

    List<Lecture> fetchedLectures = [
      Lecture(
        title: 'Lecture 1',
        subTitle: 'ICUS IC Application',
        thumbnail: 'assets/images/Lecture 1.jpg',
        duration: '03:52',
        videoUrl: 'https://www.youtube.com/watch?v=tnD8Tffs3Go',
        description: "شركة لوكا للحلول البرمجية\n"
            "بأدارة : محمود شمران عذيب\n"
            "----------------------------------\n"
            "       مميزات التطبيق:\n"
            "   1-عرض الدرجات الطالب\n"
            "   2-عرض تقارير الطالب\n"
            "   3-عرض ملاحظات الاستاذ عن الطالب\n"
            "   4-عرض الفعاليات الUnit ال3\n"
            "   5-عرض الفعاليات الاسبوعية\n"
            " 6-عرض اخر الاخبار\n"
            "\n   7-عرض احدث الEvents"
            "\n   8-عرض الصور"
            "\n   9-عرض الفيديوات"
            "\n   10-عرض كافة بيانات المكتبة وكتبها"
            "\n   11-أدارة بيانات الطلاب"
            "\n   12-تفقد اسم المستخدم في حال التكرار"
            "\n   13-توليد تلقائي لكلمة المرور واسم المستخدم"
            "\n   14-تشفير كلمة المرور للحماية من الاختراق"
            "\n   15-مشاركة بيانات تسجيل الدخول الطالب بكبسة زر"
            "\n   16-ادارة الصفوف المدرسة"
            "\n   17-ادارة الكادر الدراسي"
            "\n   18-اشعارات التلقائية بعد الاضافة"
            "\n   19-عرض كل الاشعارات المتوفرة"
            "\n   20-عرض الاشعارات في الخلفية حتى لو التطبيق متوقف"
            "\n   21-ادارة الفعاليات"
            "\n   22-ادارة ملاحظات الطالب"
            "\n   23-ادارة تقارير الطلاب"
            "\n   24-ادارة درجات الطلاب"
            "\n   25-ادارة جلسات تسجيل الدخول والحماية من الاختراق"
            "\n   26-تسجيل الدخول بصلاحيات مستخدم"
            "\n   27-متعدد اللغات"
            "\n       28-متعدد الثيم (ليلي ونهاري)"
            "\n   ---------------------------------------------"
            "\n       The official app for International University College School"
            "\n التطبيق الرسمي للمدرسة الكلية الدولية الجامعة",
        addedDate: DateTime.parse('2023-12-03'),
        channelName: 'Mahmoud Shamran',
        views: 244,
        quizId: '1',
      ),
      Lecture(
        title: 'Lecture 2',
        subTitle: 'Student Attendance System',
        thumbnail: 'assets/images/Lecture 2.jpg',
        duration: '11:37',
        videoUrl: 'https://www.youtube.com/watch?v=sJxmixxXQP8',
        description: "Student Attendance System"
            "Developer: Mahmoud Shamran\n"
            "--------\n"
            "التطبيق متوفر لاأندرويد والايفون الويندوز والماك\n"
            "Android + IOS + Windows + Mac\n"
            "--------\n"
            "\nالتطبيق موجه الى كليه التربية للعلوم الصرفة قسم علوم حياة"
            "بطلب من قبل الدكتورة - آ.م.د تيسير شمران عذيب\n"
            "--------------------------------------------------"
            "بطلب من الدكتورة من كلية التربية قسم علوم حياة نظام تسجيل حضور طلاب في جامعة واسط في كلية التربية للعلوم الصرفة ، وهو نظام مبتكر يوفر العديد من الميزات الرائعة، منها:\n"
            "-------------------------------------------------------"
            "1-بناء شبكة وتطبيق حاسوب وتطبيق موبايل بتكلفة 0 دينار عراقي: تم بناء النظام بتكلفة 0 دينار عراقي، مما يجعله متاحًا لجميع الجامعات العراقية.\n"
            "2-توليد قائمة كاملة ببيانات الطلاب: يوفر النظام قائمة كاملة ببيانات الطلاب.\n"
            "3-استخدام الكاميرا لتسجيل الحضور: يمكن للطلاب تسجيل حضورهم باستخدام الكاميرا، مما يسهل عملية التسجيل.\n"
            "4-منع تكرار تسجيل الحضور: يمنع النظام تسجيل حضور الطالب أكثر من مرة.\n"
            "5-توليد قائمة كاملة بسجل الحضور: يوفر النظام قائمة كاملة بسجل الحضور، بما في ذلك التاريخ والوقت واسم الطالب.\n"
            "6-طباعة سجل الحضور بصيغة PDF: يمكن للطلاب طباعة سجل الحضور بصيغة PDF مباشرة من خلال التطبيق.\n"
            "7-توليد تقرير عن الحضور والغياب: يمكن توليد تقرير عن الغياب، بما في ذلك إجمالي عدد أيام الحضور وتاريخ واليوم والمادةو الاستاذ.\n"
            "8-إدارة بيانات الطلاب بسهولة: يوفر النظام واجهة سهلة الاستخدام لإدارة بيانات الطلاب.\n"
            "9-تشفير بيانات وكلمة مرور الدخول بشكل آمن: يوفر النظام تشفيرًا آمنًا لبيانات الطلاب وكلمة مرور الدخول.\n"
            "10-اكتشاف الأجهزة المتكررة: يمنع النظام تسجيل حضور الطالب أكثر من مرة باستخدام نفس الجهاز.\n"
            "11-بناء شبكة بدون كهرباء وبدون راوتر: يمكن بناء الشبكة بدون كهرباء او ups وبدون راوتر، مما يجعلها أكثر توفيرا.\n"
            "12-اكتشاف تلقائي للطالب واشعار عند تسجيل الحضور باستخدام الباركود: يمكن للنظام اكتشاف الطالب تلقائيًا عند تسجيل الحضور باستخدام الباركود.\n"
            "13-ربط النظام من خلال الباركود: يمكن ربط النظام من خلال الباركود.\n"
            "14-اتصال بالشبكة من خلال الباركود: يمكن الاتصال بالشبكة من خلال الباركود.\n"
            "15-رفع ملفات للطلبة وتحميلها وقرائتها بدون انترنيت من خلال التطبيق: يمكن للطلاب رفع ملفات وتحميلها وقراءتها بدون إنترنت من خلال التطبيق.\n"
            "16-تسجيل الحضور اليدوية في حالة عدم توفر كامرة في الموبايل: يمكن للطلاب تسجيل حضورهم بطريقة يدوية في حالة عدم توفر كاميرا في الهاتف.\n"
            "17-يعتبر نظام تسجيل حضور طلاب جامعة واسط ثورة في التعليم الجامعي العراقي، حيث يوفر العديد من الميزات الرائعة التي تسهل عملية تسجيل الحضور وتجعلها أكثر دقة وأمانًا.\n"
            "18-استخدام تخزين المؤقت للبيانات وعدم اعاده تحميلها في حاله عدم توفر الانترنيت\n"
            "--------------------",
        addedDate: DateTime.parse('2023-12-03'),
        channelName: 'Mahmoud Shamran',
        views: 532,
        quizId: '2',
      ),
      Lecture(
        title: 'Lecture 3',
        subTitle: 'شرح مادة الشبكات  - IP Address و Subnet',
        thumbnail: 'assets/images/Lecture 3.jpg',
        duration: '22:31',
        videoUrl: 'https://www.youtube.com/watch?v=OstmMVlPuJY',
        description:
    "   جامعة واسط"
    "\n   كلية التربية للعلوم الصرفة"
    "\n   قسم علوم الحاسوب"
    "\n   مرحلة رابعة"
    "\n   مادة الشبكات الجانب النظري"
    "\n   ------------------------------------------------"
    "\n By : Mahmoud Shamran Al-Deresawi"
        ,
        addedDate: DateTime.parse('2023-12-03'),
        channelName: 'Mahmoud Shamran',
        views: 632,
        quizId: '3',
      ),
      Lecture(
        title: 'Lecture 4',
        subTitle: 'ملخص امتحان تصميم مواقع الشهر الثاني - بستخدام HTML , CSS',
        thumbnail: 'assets/images/Lecture 4.jpg',
        duration: '38:16',
        videoUrl: 'https://www.youtube.com/watch?v=DAu9DKEeZfg',
        description:
"   الفيديو شامل المواضيع التالية : Table, Frameset, Frame, Form, CSS \n"
"----------------------------------------------- \n"
"   جامعة واسط - كلية التربية للعلوم الصرفة - قسم علوم الحاسوب \n"
"      أعداد من قبل : محمود شمران عذيب \n"
"      By : Mahmoud Shamran Al-Deresawi \n"
"      pr_mah99@ \n"
"----------------------------------------------- \n"
        ,
        addedDate: DateTime.parse('2023-11-03'),
        channelName: 'Mahmoud Shamran',
        views: 232,
        quizId: '4',
      ),
      Lecture(
        title: 'Lecture 5',
        subTitle: "نظم تشغيل تجنب حالة ال Safe & UnSafe  - Deadlock",
        thumbnail: 'assets/images/Lecture 5.jpg',
        duration: '10:59',
        videoUrl: 'https://www.youtube.com/watch?v=5uAS5jnjOzM',
        description:
"        مادة : نظم تشغيل - مرحلة رابعة حاسوب -\n تجنب حالة الDeadlock - Safe & UnSafe\n"
"        -----------------------------------------------------------------------------\n"
"        جامعة واسط - كلية التربية للعلوم الصرفة - قسم علوم الحاسوب\n"
"      أعداد من قبل : محمود شمران عذيب\n"
"      By : Mahmoud Shamran Al-Deresawi\n"
"      pr_mah99@\n"
"      ------------------------------------------------------------------------------\n"
        ,
        addedDate: DateTime.parse('2023-11-01'),
        channelName: 'Mahmoud Shamran',
        views: 124,
        quizId: '5',
      ),
      Lecture(
        title: 'Lecture 6',
        subTitle: "تصميم قواعد بيانات موضوع الView",
        thumbnail: 'assets/images/Lecture 6.jpg',
        duration: '2:36',
        videoUrl: 'https://www.youtube.com/watch?v=SlfzkBS3Uyo',
        description:
"        شرح موضوع view بطريقة سهلة الفهم\n"
"        --------------------------------------------------------------------------\n"
"        جامعة واسط - كلية التربية للعلوم الصرفة - قسم علوم الحاسوب\n"
"      أعداد من قبل : محمود شمران عذيب\n"
"      By : Mahmoud Shamran Al-Deresawi\n"
"      pr_mah99@\n"
"      ------------------------------------------------------------------------------\n"
        ,
        addedDate: DateTime.parse('2023-11-21'),
        channelName: 'Mahmoud Shamran',
        views: 724,
        quizId: '6',
      ),
      Lecture(
        title: 'Lecture 7',
        subTitle: "VB.NET فيديو رقم 3 - عرض صورة و برمجة ساعة رقمية",
        thumbnail: 'assets/images/Lecture 7.jpg',
        duration: '11:57',
        videoUrl: 'https://www.youtube.com/watch?v=qn0P_Rz9Fh0',
        description:
        "VB.NET فيديو رقم 3 - عرض صورة \n"
      "برمجة ساعة رقمية Digital Clock \n"
      "Write V.B Program To Loading an Image at Runtime \n"
      "Program To Loading an Image in a PictureBox using Open File Dialog \n"
      "------------------------------------------------------------------------------ \n"
      "جامعة واسط - كلية التربية للعلوم الصرفة - قسم علوم الحاسوب \n"
      "أعداد من قبل : محمود شمران عذيب \n"
      "By : Mahmoud Shamran Al-Deresawi \n"
      "pr_mah99@ \n"
      "------------------------------------------------------------------------------ \n"
 ,
        addedDate: DateTime.parse('2021-07-21'),
        channelName: 'Mahmoud Shamran',
        views: 119,
        quizId: '7',
      ),
      Lecture(
        title: 'Lecture 8',
        subTitle: "ذكاء اصطناعي عملي برولوك - طباعة مثلث بالمقلوب",
        thumbnail: 'assets/images/Lecture 8.jpg',
        duration: '03:17',
        videoUrl: 'https://www.youtube.com/watch?v=B8yCcvbmyKU',
        description:
"        طباعة (رسم) مثلث بالمقلوب🙃 Inverted Triangle Print\n"
"    Universty Of Wasit  - جامعة واسط\n"
"    كلية الاتربية للعوم الصرفة\n"
"    حاسوب مرحلة ثالثة\n"
"    مادة : artificial intelligence  ذكاء اصطناعي عملي برولوك\n"
    ,
        addedDate: DateTime.parse('2021-06-19'),
        channelName: 'Mahmoud Shamran',
        views: 602,
        quizId: '8',
      ),
      // Add more lectures as needed
    ];

    lectures.assignAll(fetchedLectures);
    isLoading.value = false;

    update(); // تأكد من استخدامها هنا
  }

  void addLectureGroup(List<Lecture> newLectures) {
    lectures.addAll(newLectures);
  }
}
