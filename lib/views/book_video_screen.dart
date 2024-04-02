import 'package:bgs_app/controllers/video_player.dart';
import 'package:bgs_app/models/books.dart';
import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/books_screen.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatelessWidget {
  final Books book;

  const VideoPlayerScreen(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Row(
          children: [
            BackButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BooksScreen()));
              },
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 36, 86, 127),
        title: Text(
          book.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: VideoPlayer(book.videoURL),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text(
              book.title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 36, 86, 127),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.topLeft,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: book.questionCount,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.white,
                            side:
                                const BorderSide(width: 2, color: Colors.grey)),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      );
                    },
                  ),
                )),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
