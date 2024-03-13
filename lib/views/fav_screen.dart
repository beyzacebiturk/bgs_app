import 'package:bgs_app/navbar/navbar_states.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/views/home.dart';

class FavScreen extends StatelessWidget {
   FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Row(
          children: [
            BackButton(
              onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));},
              color: Colors.white,
            )
          ],
        ), 
          backgroundColor: const Color.fromARGB(255, 36, 86, 127),
          title: const Text(
            "Favori kitaplarınıza erişebilirsiniz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        bottomNavigationBar: Navbar(),
    );
  }
}