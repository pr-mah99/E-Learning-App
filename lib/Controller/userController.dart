import 'package:app_dev_task/Model/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  static final GetStorage _box = GetStorage();
  static const _keyUsers = 'users';
  RxBool isLoading = true.obs; // إضافة isLoading

  RxList<UserModel> users = <UserModel>[].obs;

  // Add this line to declare targetLectureName
  String targetLectureName = '';

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> saveUser(UserModel user) async {
    users.add(user);
    await _box.write(_keyUsers, users.map((user) => user.toJson()).toList());
  }

  Future<void> loadUsers() async {
    isLoading.value = true;

    final List<dynamic> userMaps = _box.read<List<dynamic>>(_keyUsers) ?? [];

    if (targetLectureName.isNotEmpty) {
      // تصفية المستخدمين باستخدام targetLectureName
      users.assignAll(userMaps
          .where((userMap) =>
      UserModel.fromJson(userMap).lectureName == targetLectureName)
          .map((userMap) => UserModel.fromJson(userMap))
          .toList());
    } else {
      // تحميل كل المستخدمين بدون تصفية
      users.assignAll(userMaps.map((userMap) => UserModel.fromJson(userMap)).toList());
    }

    isLoading.value = false;
  }

  Future<void> clearUsers() async {
    users.clear();
    await _box.remove(_keyUsers);
  }
}
