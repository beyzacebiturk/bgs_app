import 'package:bgs_app/controllers/fav_provier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Books {
  int id;
  final String title;
  int publishedYear;
  final String grade;
  final String branch;
  final String category;
  //final String bookImage;
  final String bookURL;
  bool isFavorite;

  Books({
    required this.id,
    required this.title,
    required this.publishedYear,
    //required this.bookImage,
    required this.branch,
    required this.category,
    required this.grade,
    required this.bookURL,
    this.isFavorite = false,
  });

  Books copyWith({
    int? id,
    String? title,
    int? publishedYear,
    String? grade,
    String? branch,
    String? category,
    String? bookURL,
    bool? isFavorite,
  }) {
    return Books(
      id: id ?? this.id,
      title: title ?? this.title,
      publishedYear: publishedYear ?? this.publishedYear,
      grade: grade ?? this.grade,
      branch: branch ?? this.branch,
      category: category ?? this.category,
      bookURL: bookURL ?? this.bookURL,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  void toggleFavorite(WidgetRef ref) {
    isFavorite = !isFavorite;

    ref.read(favoriteProvider.notifier).setFavorite(id, isFavorite);
  }
  
}

List<Books> favoriteBooks = [];

final List<Books> books = [
  Books(
      id: 1,
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      id: 2,
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      id: 3,
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      id: 4,
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
];
