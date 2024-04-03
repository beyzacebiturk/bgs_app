import 'package:bgs_app/models/books.dart';
import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/book_item.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/views/filter_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksScreen extends ConsumerWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 36, 86, 127),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              MaterialButton(
                minWidth: double.tryParse('50'),
                height: 40,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FilterPage()));
                },
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 36, 86, 127),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.filter_list,
                      color: Color.fromARGB(255, 36, 86, 127),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'FİLTRE',
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 86, 127),
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 36, 86, 127), width: 3),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 36, 86, 127),
                      width: 3,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 36, 86, 127),
                    size: 26,
                  ),
                  hintText: 'Kitap Arama',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Expanded( 
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookItem(
                      books[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Navbar(),
      ),
    );
  }
}
