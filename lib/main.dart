import 'package:app_dev_task/Services/Constant/constant.dart';
import 'package:app_dev_task/View/Quiz/quizScreen.dart';
import 'package:app_dev_task/View/Setting/Setting.dart';
import 'package:app_dev_task/View/errorPage.dart';
import 'package:app_dev_task/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services/UI/theme.dart';
import 'View/HomeScreen/details.dart';
import 'View/HomeScreen/home.dart';
import 'View/Quiz/result.dart';
import 'View/Quiz/User.dart';
import 'View/Quiz/UserDetails.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  userName = prefs.getString("username") ?? 'Mahmoud Shamran';

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final RxBool _isLightTheme = false.obs;
  _getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? false;
    }).obs;
    _isLightTheme.value = (await isLight.value);
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getThemeStatus();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Learning App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'Droid Arabic Kufi',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: buttonStyleLight,
        ),
        textButtonTheme: TextButtonThemeData(
          style: buttonStyleLight,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: 'Droid Arabic Kufi',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: buttonStyleDark,
        ),
        textButtonTheme: TextButtonThemeData(
          style: buttonStyleDark,
        ),
      ),
      themeMode: _isLightTheme.value ? ThemeMode.light:ThemeMode.dark,

      // home: MyHomePage(),
      initialRoute: '/splash',
      // initialRoute: '/',
      unknownRoute: GetPage(
          name: '/notfound',
          page: () => const errorPage()), //like 404 page in web
      getPages: [
        GetPage(name: '/splash', page: () => const splashScreen()),
        GetPage(name: '/', page: () => homeScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: '/lectureDetail',
            page: () => const LectureDetailScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: '/setting',
            page: () => settingScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: '/quiz',
            page: () => const QuizScreen(),
            transition: Transition.zoom),
        GetPage(
            name: '/top',
            page: () =>  UserScreen(),
            transition: Transition.zoom),
        GetPage(
            name: '/topDetails',
            page: () =>  const UserDetailsScreen(),
            transition: Transition.circularReveal),
        GetPage(
            name: '/result',
            page: () => const resultScreen(),
            transition: Transition.zoom),
      ],
    );

  }
}
