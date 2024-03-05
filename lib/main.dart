import 'package:bgs_app/views/navbar_screen.dart';
import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/login.dart';
import 'package:bgs_app/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/providers/navbar_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NavbarProvider>(create: (_)=>NavbarProvider())
  ],child: const HomePage()), );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarScreen(),
    );
  }
}
