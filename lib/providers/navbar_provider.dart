import 'package:flutter/material.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/login.dart';

class NavbarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
  final List<NavbarP> _items = [
    NavbarP(widget: const Home(),name: 'Kitaplar',icon: Icons.book),
    NavbarP(widget: const FavScreen(),name: 'Favoriler',icon: Icons.star),
    NavbarP(widget: const HelpScreen(),name: 'Yardım',icon: Icons.question_mark),
    NavbarP(widget: const LoginPage(),name: 'Üyelik',icon: Icons.person),
  ];

  List<NavbarP> get items => _items;
}

class NavbarP {
  String? name;
  IconData? icon;
  Widget? widget;

  NavbarP({this.widget, this.name, this.icon});
}

/* RIVERPOD DENEMESİ STATE SAYFASI
import 'package:bgs_app/providers/nav_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavNotifier extends StateNotifier<NavStates>{
  NavNotifier():super(const NavStates());
  void onIndexChanged(int index){
    state = state.copyWith(index:index);
  }
}

final NavProvider = StateNotifierProvider<NavNotifier, NavStates>((ref) => NavNotifier());*/