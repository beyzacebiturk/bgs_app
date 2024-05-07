import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:bgs_app/models/books.dart';
import 'package:bgs_app/views/appbar.dart';
import 'package:bgs_app/views/report_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportProvider = StateProvider<int>((ref) => 0);

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Books book;
  const VideoPlayer(this.videoUrl, this.book, {super.key});

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
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        showSeekButtons: true,
      ),
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.book.title,
        backButton: true,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
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
                            _customVideoPlayerController.videoPlayerController
                                .play();
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
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Hatalı Soru Bildirimi'),
          content: Text('Bu sorunun hatalı olduğunu bildiriyorsunuz'),
          actions: <Widget>[
            ReportProvider(),
          ],
        );
      },
    );
  }
}
