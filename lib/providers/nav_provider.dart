import 'package:bgs_app/providers/nav_provider.dart';
import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class NavbarScreen extends ConsumerWidget {
  NavbarScreen({super.key});

  final List<Widget> list = [
    const Home(),
    FavScreen(),
    HelpScreen(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(bottomNavIndexProvider.state);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 86, 127),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 36, 86, 127),
        type: BottomNavigationBarType.fixed,
        iconSize: 27,
        onTap: (value) {
          ref.refresh(bottomNavIndexProvider.state).state = value;
        },
        currentIndex: index.state,
        items: const [
          BottomNavigationBarItem(
            label: 'Kitaplar',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'Favoriler',
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: 'Yardım'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Üyelik',
          )
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: index.state,
          children: list,
        ),
      ),
    );
  }
}
