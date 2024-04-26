import 'package:bgs_app/views/books_screen.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.backButton = false});

  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 36, 86, 127),
      automaticallyImplyLeading: backButton,
      leading: backButton
          ? BackButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BooksScreen()));
              },
              color: Colors.white,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
