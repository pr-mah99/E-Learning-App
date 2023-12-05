import 'package:app_dev_task/Services/convertToAgo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Model/lecture_model.dart';
import '../../Widget/HomeScreen/youtubeVideoPlayer.dart';

class LectureDetailScreen extends StatelessWidget {
  const LectureDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Lecture lecture = Get.arguments as Lecture;

    return Scaffold(
      appBar: AppBar(
        title: Text(lecture.title),
        actions: [
          Text(
            convertToAgo(lecture.addedDate),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                height: 230,
                child: youtubeVideoPlayer(
                  videoURL: lecture.videoUrl,
                )),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    lecture.subTitle,
                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    lecture.description,
                    style: const TextStyle(fontSize: 12),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // تنقل إلى صفحة الاختبار
                  Get.toNamed('/quiz', arguments: lecture);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Take Quiz',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var url = Uri.parse(lecture.videoUrl);
                  await launchUrl(url,
                  mode: LaunchMode.externalApplication);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'مشاهدة من خلال تطبيق اليوتيوب',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
