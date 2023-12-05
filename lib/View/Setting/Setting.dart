import 'package:app_dev_task/Services/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingScreen extends StatefulWidget {
  settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final RxBool _isLightTheme = false.obs;

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
  }

  _getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? false;
    }).obs;
    _isLightTheme.value = (await isLight.value);
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  // ---------------
  final RxBool isManual = false.obs;
  var ipAddressValue = TextEditingController();

  Future<void> Setting_ip(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'username',
      val,
    );
    userName = val;
    isManual.value=!isManual.value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getThemeStatus();
    ipAddressValue.text=userName!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ألاعدادات'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
            () =>  !isManual.value? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userName!),
                const SizedBox(width: 5,),
                TextButton(onPressed: (){
                  isManual.value=!isManual.value;
                }, child: const Text('تغير')),
              ],
            ):
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: ipAddressValue,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "الاسم",
                      prefixIcon: Icon(
                        Icons.supervised_user_circle,
                      ),
                    ),
                    onChanged: (String val) {
                      ipAddressValue.text = val.trim();
                    },
                  ),
                ),
                const SizedBox(width: 5,),
                TextButton(onPressed: (){
                  if(ipAddressValue.text.isNotEmpty){
                  Setting_ip(ipAddressValue.text);}
                  else{
                    Get.snackbar('خطأ', "يجب ادخال الاسم اولاً");
                  }
                }, child: const Text('حفظ التغيرات')),
              ],
            ),),
            const SizedBox(height: 20,),
            const Text(
              'تبديل بين الليل والنهار',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ObxValue(
                  (data) => Switch(
                value: _isLightTheme.value,
                onChanged: (val) {
                  _isLightTheme.value = val;
                  Get.changeThemeMode(
                    _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                  );
                  _saveThemeStatus();
                },
              ),
              false.obs,
            ),

            const SizedBox(
              height: 20,
            ),
            const Text(
              '@ 2024',
            ),
            const Text(
              'V 1.0.0',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),),
    );
  }
}
