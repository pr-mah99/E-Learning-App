import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/lecture_controller.dart';
import '../../Model/lecture_model.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});

  final LectureController lectureController = Get.put(LectureController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('E-Learning App'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("/setting");
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: GetX<LectureController>(
          initState: (_) {
            lectureController.fetchLectures();
          },
          builder: (controller) {
            return lectureController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.lectures.length,
                    itemBuilder: (context, index) {
                      Lecture lecture = controller.lectures[index];
                      return Container(
                          // height: 22,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.pinkAccent.withOpacity(0.1),
                            Colors.pinkAccent.withOpacity(0.4),
                          ])),
                          margin: const EdgeInsetsDirectional.all(2),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/lectureDetail', arguments: lecture);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed('/lectureDetail',
                                            arguments: lecture);
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        lecture.thumbnail),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned(
                                            bottom: 4.0,
                                            right: 4.0,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 1,
                                                  bottom: 1,
                                                  left: 4,
                                                  right: 4),
                                              color: (lecture.duration ==
                                                      "Live")
                                                  ? Colors.red.withOpacity(0.88)
                                                  : Colors.black54,
                                              child: Text(
                                                lecture.duration ?? '',
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 15),
                                      child: Column(
                                        children: [
                                          Text(
                                            lecture.title ?? '',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            lecture.channelName ?? '',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                lecture.views.toString() ?? '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(
                                                  CupertinoIcons.eye_fill)
                                            ],
                                          ),
                                          Visibility(
                                            visible: lecture.quizId == '1' ||
                                                lecture.quizId == '2',
                                            child: Text(
                                              'لايتحتوي على اسئلة',
                                              style: TextStyle(
                                                  shadows: [
                                                    const Shadow(
                                                        color: Colors.redAccent,
                                                        blurRadius: 11,
                                                        offset: Offset.zero),
                                                    Shadow(
                                                        offset: const Offset(
                                                            1.0, -1.0),
                                                        color: Colors.red
                                                            .withOpacity(0.3)),
                                                  ],
                                                  // color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 9),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    },
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/top");
          },
          tooltip: 'Top',
          child: const Row(
            children: [Icon(Icons.question_mark), Text('Top')],
          ),
        ),
      ),
    );
  }
}
