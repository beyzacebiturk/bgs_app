import 'package:bgs_app/views/home.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedYear;
  String? selectedCategory;
  String? selectedBranch;
  String? selectedGrade;

  List<String> years = ['2019', '2020', '2021', '2022'];
  List<String> categories = ['soru bankası', 'föy', 'test'];
  List<String> branches = ['mat', 'kimya'];
  List<String> grades = ['tyt', 'ayt'];

  void clearFilters() {
    setState(() {
      selectedYear = null;
      selectedCategory = null;
      selectedBranch = null;
      selectedGrade = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            BackButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 36, 86, 127),
        title: const Text(
          "Filtreleme",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            buildDropdown('Basım Yılı', years, selectedYear, (value) {
              setState(() {
                selectedYear = value;
              });
            }),
            buildDropdown('Kategori', categories, selectedCategory, (value) {
              setState(() {
                selectedCategory = value;
              });
            }),
            buildDropdown('Ders', branches, selectedBranch, (value) {
              setState(() {
                selectedBranch = value;
              });
            }),
            buildDropdown('Sınıf', grades, selectedGrade, (value) {
              setState(() {
                selectedGrade = value;
              });
            }),
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      {
                        'year': selectedYear,
                        'category': selectedCategory,
                        'branch': selectedBranch,
                        'grade': selectedGrade,
                      },
                    );
                  },
                  shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                  child: const Text(
                    'FİLTRELE',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    clearFilters();
                  },
                    shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                  child: const Text(
                    'TEMİZLE',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        value: selectedValue,
        onChanged: onChanged,
      ),
    );
  }
}
