import 'package:bgs_app/models/books.dart';
import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  int _selectedIndex = 0;

  void _updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
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
                  _controller.seekTo(Duration.zero);
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
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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
    int selectedIndex = 0;
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
