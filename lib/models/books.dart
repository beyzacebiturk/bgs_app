class Books {
  final String title;
  final int publishedYear;
  final String grade;
  final String branch;
  final String category;
  //final String bookImage;
  final String bookURL;
  bool isFavorite;

  Books(
      {required this.title,
      required this.publishedYear,
      //required this.bookImage,
      required this.branch,
      required this.category,
      required this.grade,
      required this.bookURL,
       this.isFavorite = false,
      });
}

List<String> selectedBooks = [];

final List<Books> books = [
  Books(
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      title: 'Kitap',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
];
