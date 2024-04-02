class Books {
  int id;
  final String title;
  int publishedYear;
  final String grade;
  final String branch;
  final String category;
  //final String bookImage;
  final String bookURL;
  final String videoURL;
  final int questionCount;

  Books({
    required this.id,
    required this.title,
    required this.publishedYear,
    //required this.bookImage,
    required this.branch,
    required this.category,
    required this.grade,
    required this.bookURL,
    required this.videoURL,
    required this.questionCount,
  });
}

final List<Books> books = [
  Books(
      id: 1,
      title: 'Kitap1',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      questionCount: 8,
      videoURL:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      id: 2,
      title: 'Kitap2',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      questionCount: 4,
      videoURL:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      id: 3,
      title: 'Kitap3',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      questionCount: 5,
      videoURL:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
  Books(
      id: 4,
      title: 'Kitap4',
      publishedYear: 2020,
      category: 'Ders Anlatım Föyü Testler',
      grade: 'TYT',
      branch: 'Mat',
      questionCount: 10,
      videoURL: 'https://youtu.be/zWh3CShX_do',
      bookURL:
          'https://img.freepik.com/premium-vector/vector-icon-illustration-pink-heart-isolated-white-background_921039-1845.jpg'),
];
