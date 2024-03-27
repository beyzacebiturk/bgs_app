import 'package:bgs_app/controllers/fav_provier.dart';
import 'package:bgs_app/models/books.dart';
import 'package:bgs_app/views/book_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookItem extends ConsumerWidget {
  const BookItem(this.book, {super.key});

  final Books book;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  VideoPlayerScreen(book),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 200,
                    child: Image.network(
                      book.bookURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Basım Yılı: ',
                                ),
                                TextSpan(
                                  text: book.publishedYear.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(book.branch),
                          Text(book.category),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 36, 86, 127),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "TESTLER",
                      style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 85,
                        color: const Color.fromARGB(255, 120, 149, 172),
                        child: IconButton(
                          onPressed: () {
                            ref
                                .read(favoriteBooksProvider.notifier)
                                .toggleBookFavoriteStatus(book);
                          },
                          icon: Icon(
                            ref.watch(favoriteBooksProvider).contains(book)
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
