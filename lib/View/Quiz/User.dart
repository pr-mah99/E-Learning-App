import 'package:app_dev_task/Services/convertToAgo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../Controller/userController.dart';
import '../../Model/user_model.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController userController = Get.put(UserController());

  void goDetails(UserModel val) {
    Get.toNamed('/topDetails', arguments: val);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null && Get.arguments['lecture'] != null) {
      userController.targetLectureName = Get.arguments['lecture'];
    }

    userController.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top - ألافضل'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                await GetStorage().erase();
                userController.loadUsers();
              },
              label: const Text('حذف'),
              icon: const Icon(
                Icons.delete,
                color: Colors.pink,
              ),
            ),
          )
        ],
      ),
      body: Obx(
              () {
        final users = userController.users;
        return userController.isLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : users.isNotEmpty
            ? ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('#${index + 1}'),
                  const Divider(),
                  ListTile(
                    leading: Hero(
                        tag: user.date,
                        child: const Icon(Icons.account_circle,
                            size: 50)),
                    title: Text(user.username),
                    subtitle: Text('User: ${user.username}'),
                    onTap: () {
                      goDetails(user);
                      // قم بتحديث البيانات عند النقر على المستخدم
                      print('User ${user.username} tapped');
                      // userController.updateUserData(); // قم بتحديث البيانات عند النقر على المستخدم
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.school, size: 50),
                    title: Text(user.lectureName),
                    subtitle: Text('Lecture: ${user.lectureName}'),
                    onTap: () {
                      goDetails(user);
                      // قم بتحديث البيانات عند النقر على المستخدم
                      print('User ${user.lectureName} tapped');
                      // userController.updateUserData(); // قم بتحديث البيانات عند النقر على المستخدم
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.grade,
                      size: 50,
                      color: user.grade > 0
                          ? Colors.yellow
                          : Colors.yellow.withOpacity(0.2),
                    ),
                    title: Text(user.grade.toString()),
                    subtitle: Text('Grade: ${user.grade}'),
                    onTap: () {
                      goDetails(user);
                      // قم بتحديث البيانات عند النقر على المستخدم
                      print('User ${user.grade} tapped');
                      // userController.updateUserData(); // قم بتحديث البيانات عند النقر على المستخدم
                    },
                  ),
                  ListTile(
                    leading:
                    const Icon(Icons.calendar_today, size: 50),
                    title: const Text('Date'),
                    subtitle: Text(
                        'Date: ${DateFormat('yyyy-MM-dd').format(user.date)} - ${convertToAgo(user.date)}'),
                    onTap: () {
                      goDetails(user);
                      // قم بتحديث البيانات عند النقر على المستخدم
                      print('User ${user.date} tapped');
                      // userController.updateUserData(); // قم بتحديث البيانات عند النقر على المستخدم
                    },
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        )
            : const Center(child: Text('لا يوجد بيانات'));
      }),
    );
  }
}

