import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  double _containerSize = 1.5;
  double _containerOpacity = 0.1;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _controller.forward();



    Timer(const Duration(seconds: 1), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 2), () {

      // Get.toNamed("/home");
      Get.offAllNamed("/home");

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Theme.of(context).canvasColor,
        width: width,
        height: height,
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1100),
            curve: Curves.fastOutSlowIn,
            opacity: _containerOpacity,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 2700),
                curve: Curves.fastLinearToSlowEaseIn,
                height: width / _containerSize + 50,
                width: width / _containerSize + 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child:  Lottie.asset(
                        'assets/images/loading.json', // replace with your Lottie animation file
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'مرحباً بك',
                        style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}