import 'package:bgs_app/controllers/fav_provier.dart';
import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/book_item.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/views/books_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBooks = ref.watch(favoriteBooksProvider);
        debugPrint('favorite Books list length: ${favoriteBooks.length}');
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
        title: const Text(
          "Favori kitaplarınıza erişebilirsiniz",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: favoriteBooks.length,
          itemBuilder: (context, index) {
            return BookItem(
              favoriteBooks[index],
            );
          },
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
