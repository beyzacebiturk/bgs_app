import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/views/filter_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            ],
          ),
        ),
       
      ),
    );
  }
}
