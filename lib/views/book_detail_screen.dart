import 'package:bgs_app/views/books_screen.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: IconButton(onPressed:() {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BooksScreen()));
        }, icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}