import 'package:bgs_app/controllers/video_player_portrait.dart';
import 'package:bgs_app/models/books.dart';
import 'package:bgs_app/views/book_item.dart';
import 'package:bgs_app/views/filter_screen.dart';
import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/books_screen.dart';
import 'package:bgs_app/views/login.dart';
import 'package:bgs_app/views/report_dialog.dart';
import 'package:bgs_app/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: HomePage()),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BooksScreen(),
    );
  }
}
