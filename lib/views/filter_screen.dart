import 'package:bgs_app/views/books_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = StateProvider((ref) => FilterOptions());

class FilterOptions {
  String? selectedYear;
  String? selectedCategory;
  String? selectedBranch;
  String? selectedGrade;

  List<String> years = ['2019', '2020', '2021', '2022'];
  List<String> categories = ['soru bankası', 'föy', 'test'];
  List<String> branches = ['mat', 'kimya'];
  List<String> grades = ['tyt', 'ayt'];

  void clearFilters() {
    selectedYear = null;
    selectedCategory = null;
    selectedBranch = null;
    selectedGrade = null;
  }
}

class FilterPage extends ConsumerWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            BackButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BooksScreen()));
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
            buildDropdown('Basım Yılı', filter.years, filter.selectedYear,
                (value) {
              ref.read(filterProvider).selectedYear = value;
            }),
            buildDropdown(
                'Kategori', filter.categories, filter.selectedCategory,
                (value) {
              ref.read(filterProvider).selectedCategory = value;
            }),
            buildDropdown('Ders', filter.branches, filter.selectedBranch,
                (value) {
              ref.read(filterProvider).selectedBranch = value;
            }),
            buildDropdown('Sınıf', filter.grades, filter.selectedGrade,
                (value) {
              ref.read(filterProvider).selectedGrade = value;
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
                        'year': filter.selectedYear,
                        'category': filter.selectedCategory,
                        'branch': filter.selectedBranch,
                        'grade': filter.selectedGrade,
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
                    filter.clearFilters();
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
}

Widget buildDropdown(String label, List<String> items, String? selectedValue,
    void Function(String?) onChanged) {
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
