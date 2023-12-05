import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../../Services/convertToAgo.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Get.arguments;
    // print('user=$user');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top تفاصيل'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RippleAnimation(
            color: Theme.of(context).colorScheme.primary,
            delay: const Duration(milliseconds: 300),
            repeat: true,
            minRadius: 75,
            ripplesCount: 16,
            duration: const Duration(milliseconds: 4 * 500),
            child: Hero(
                tag: user.date,
                child: const Icon(Icons.account_circle, size: 280)),
          ),
          Text(user.username,style: const TextStyle(fontWeight: FontWeight.w700),),
          Text('User: ${user.username}',style: const TextStyle(color: Colors.grey),),
          ListTile(
            leading: const Icon(Icons.school, size: 50),
            title: Text(user.lectureName),
            subtitle: Text('Lecture: ${user.lectureName}'),
          ),
          ListTile(
            leading: Icon(Icons.grade, size: 50,color: user.grade>0?Colors.yellow:Colors.yellow.withOpacity(0.2),),
            title: Text(user.grade.toString()),
            subtitle: Text('Grade: ${user.grade}'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, size: 50),
            title: const Text('Date'),
            subtitle: Text(
                'Date: ${DateFormat('yyyy-MM-dd').format(user.date)} - ${convertToAgo(user.date)}'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
