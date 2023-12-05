import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubeVideoPlayer extends StatefulWidget {
  const youtubeVideoPlayer({super.key, required this.videoURL});
  final String videoURL;

  @override
  State<youtubeVideoPlayer> createState() => _youtubeVideoPlayerState();
}

class _youtubeVideoPlayerState extends State<youtubeVideoPlayer> {

  late YoutubePlayerController _controller;
  late String videoId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // ------------
    videoId = YoutubePlayer.convertUrlToId(widget.videoURL)!;
    // print(videoId); // BBAyRBTfsOU
    // ------------
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YoutubePlayer(
          controller: _controller,
        ),
      ),
    );
  }
}
