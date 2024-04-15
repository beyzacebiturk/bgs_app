import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/books_screen.dart';
import 'package:bgs_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bgs_app/navbar/navbar_provider.dart';

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 60),
            navbarIcon(
                icon: Icons.book,
                onpressed: () {
                  ref.read(selectedIndexProvider.notifier).update((state) => 0);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BooksScreen(),
                    ),
                  );
                },
                isSelected: selectedIndex != 0,
                label: 'Kitaplar'),
            navbarIcon(
                icon: Icons.star,
                onpressed: () {
                  ref.read(selectedIndexProvider.notifier).update((state) => 1);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavScreen(),
                    ),
                  );
                },
                isSelected: selectedIndex != 1,
                label: 'Favoriler'),
            navbarIcon(
                icon: Icons.question_mark,
                onpressed: () {
                  ref.read(selectedIndexProvider.notifier).update((state) => 2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpScreen(),
                    ),
                  );
                },
                isSelected: selectedIndex != 2,
                label: 'Yardım'),
            navbarIcon(
                icon: Icons.person,
                onpressed: () {
                  ref.read(selectedIndexProvider.notifier).update((state) => 3);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                isSelected: selectedIndex != 3,
                label: 'Üyelik'),
          ],
        ),
      ),
    );
  }
}
