import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navbar extends ConsumerWidget {
  Navbar({super.key});

  final selectedIndexProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider.state).state;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: navbarIcon(
                  icon: Icons.book,
                  onpressed: () {
                    ref
                        .read(selectedIndexProvider.notifier)
                        .update((state) => 0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  isSelected: selectedIndex == 0,
                  label: 'Kitaplar'),
            ),
            Expanded(
              child: navbarIcon(
                  icon: Icons.star,
                  onpressed: () {
                    ref
                        .read(selectedIndexProvider.notifier)
                        .update((state) => 1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavScreen(),
                      ),
                    );
                  },
                  isSelected: selectedIndex == 1,
                  label: 'Favoriler'),
            ),
            Expanded(
              child: navbarIcon(
                  icon: Icons.question_mark,
                  onpressed: () {
                    ref
                        .read(selectedIndexProvider.notifier)
                        .update((state) => 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpScreen(),
                      ),
                    );
                  },
                  isSelected: selectedIndex == 2,
                  label: 'Yardım'),
            ),
            Expanded(
              child: navbarIcon(
                  icon: Icons.person,
                  onpressed: () {
                    ref
                        .read(selectedIndexProvider.notifier)
                        .update((state) => 3);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  isSelected: true,
                  label: 'Üyelik'),
            ),
          ],
        ),
      ),
    );
  }
}

MaterialButton navbarIcon({
  required IconData icon,
  required VoidCallback onpressed,
  required bool isSelected,
  required String label,
}) {
  return MaterialButton(
    onPressed: onpressed,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Icon(
          icon,
          size: 40,
          color:
              isSelected ? const Color.fromARGB(255, 36, 86, 127) : Colors.grey,
        ),
       /* Positioned( //ICON ALTINDAKİ LABEL - HATALI
          bottom: 0,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? const Color.fromARGB(255, 36, 86, 127)
                  : Colors.grey,
            ),
          ),
        ),*/
      ],
    ),
  );
}
