class Books {
  String? title;
  String? publishedYear;
  String? grade;
  String? branch;
  String? category;
  String? bookImage;

  Books({
    this.title,
    this.publishedYear,
    this.bookImage,
    this.branch,
    this.category,
    this.grade,
  });
}

List<String> selectedBooks = [];

final List<Books> books = [
  Books(
      title: 'Kitap',
      publishedYear: '2020',
      grade: '12',
      branch: 'Mat',
      category: 'tyt'),
  Books(
      title: 'Kitap',
      publishedYear: '2020',
      grade: '12',
      branch: 'Mat',
      category: 'tyt'),
  Books(
      title: 'Kitap',
      publishedYear: '2020',
      grade: '12',
      branch: 'Mat',
      category: 'tyt'),
  Books(
      title: 'Kitap',
      publishedYear: '2020',
      grade: '12',
      branch: 'Mat',
      category: 'tyt'),
];
