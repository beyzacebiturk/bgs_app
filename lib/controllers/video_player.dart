import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  const VideoPlayer(this.videoUrl, {Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
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
        customVideoPlayerSettings:
            const CustomVideoPlayerSettings(showSeekButtons: true));
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
             CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController,
              ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: 'replay',
                backgroundColor: Colors.white,
                onPressed: () {
                  _customVideoPlayerController.videoPlayerController
                      .seekTo(Duration.zero);
                },
                child: const Icon(
                  Icons.fast_rewind,
                  color: Colors.black54,
                ),
              ),
              FloatingActionButton(
                heroTag: 'play-pause',
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    if (_customVideoPlayerController
                        .videoPlayerController.value.isPlaying) {
                      _customVideoPlayerController.videoPlayerController
                          .pause();
                    } else {
                      _customVideoPlayerController.videoPlayerController.play();
                    }
                  });
                },
                child: Icon(
                  _videoPlayerController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                heroTag: 'report',
                backgroundColor: Colors.white,
                onPressed: () {
                  _dialogBuilder(context);
                },
                child: const Text(
                  'BİLDİR',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              FloatingActionButton(
                heroTag: 'sd',
                backgroundColor: Colors.white,
                onPressed: () {},
                child: const Text(
                  'SD',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              FloatingActionButton(
                heroTag: 'hd',
                backgroundColor: Colors.white,
                onPressed: () {},
                child: const Text(
                  'HD',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Hatalı Soru Bildirimi'),
          content: const Text('Bu sorunun hatalı olduğunu bildiriyorsunuz'),
          actions: <Widget>[
            //TEXT BUTONLARI KOY

            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.grey[300]),
              child: const Text(
                'Vazgeç',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Gönder',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

