import 'package:bgs_app/controllers/fav_provier.dart';
import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/appbar.dart';
import 'package:bgs_app/views/book_item.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/views/books_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBooks = ref.watch(favoriteBooksProvider);
    debugPrint('favorite Books list length: ${favoriteBooks.length}');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const MyAppBar(
        title: "Favori kitaplarınıza erişebilirsiniz",
        backButton: true,
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
      bottomNavigationBar: const Navbar(),
    );
  }
}
