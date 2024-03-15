import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/book_detail_screen.dart';
import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/views/filter_screen.dart';
import 'package:bgs_app/models/books.dart';
import 'package:flutter/widgets.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksScreen> {
  final controller = TextEditingController();

  //String selectedFilter = 'Tümü';
  //List<String> filterOptions = ['Tümü', 'Filtre 1', 'Filtre 2', 'Filtre 3'];

  /*void _showFilterDialog() {  ///SHOWDIALOG İÇİNDE FİLTRELEME
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('FİLTRE'),
          content: Column(
            children: [
              for (String option in filterOptions)
                RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: selectedFilter,
                  onChanged: (String? value) {
                    setState(() {
                      selectedFilter = value!;
                      Navigator.of(context).pop();
                    });
                  },
                ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Okay'),
              onPressed: () {
                ///filtrelenecek öz. olacak
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                  child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookDetailScreen(),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Image.network(
                                    books[index].bookURL,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          books[index].title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Basım Yılı: ',
                                              ),
                                              TextSpan(
                                                text: books[index]
                                                    .publishedYear
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(books[index].branch),
                                        Text(books[index].category),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            color: const Color.fromARGB(255, 36, 86, 127),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "TESTLER",
                                    style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                               
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 70,
                                      color: const Color.fromARGB(
                                          255, 120, 149, 172),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star_border,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
        bottomNavigationBar: Navbar(),
      ),
    );
  }
}
