import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandscapeVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const LandscapeVideoPlayer(this.videoUrl, {super.key});

  @override
  State<LandscapeVideoPlayer> createState() => _LandscapeVideoPlayerState();
}

class _LandscapeVideoPlayerState extends State<LandscapeVideoPlayer> {
  late CachedVideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        CachedVideoPlayerController.network(widget.videoUrl)
          ..initialize().then((_) {
            _customVideoPlayerController.videoPlayerController.play();
            setState(() {});
          });

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        showSeekButtons: true,
      ),
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomVideoPlayer(
        customVideoPlayerController: _customVideoPlayerController,
      ),
    );
  }
}
