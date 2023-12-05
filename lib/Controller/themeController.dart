import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends GetxController {
  final RxBool _isLightTheme = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  ThemeManager() {
    _getThemeStatus();
  }

  bool get isLightTheme => _isLightTheme.value;

  void saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
    update(); // Notify listeners
  }

  Future<void> _getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    _isLightTheme.value = (await isLight.value);
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}