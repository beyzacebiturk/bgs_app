import 'dart:math';
import 'package:bgs_app/providers/nav_provider.dart';
import 'package:bgs_app/views/filter_screen.dart';
import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/login.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavbarScreen(),
    );
  }
}
