import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class errorPage extends StatelessWidget {
  const errorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Error Page'),
      // ),
      body:Column(
        children: [
          Lottie.asset(
            'assets/images/error.json', // replace with your Lottie animation file
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            repeat: true, // set to false if you want the animation to play only once
          ),
          SizedBox(height: 50,),
          const Text('الصفحة غير متوفرة'),
        ],
      ),
    );
  }
}
