import 'package:bgs_app/models/books.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = StateNotifierProvider<FavoriteListState, List<Books>>(
  (ref) {
    return FavoriteListState();
  },
);

class FavoriteListState extends StateNotifier<List<Books>> {
  FavoriteListState() : super([]);

  void setFavorite(int id, bool isFavorite) {
    var newState = state.map(
      (book) {
        if (book.id == id) {
          return book.copyWith(isFavorite: isFavorite);
        } else {
          return book;
        }
      },
    ).toList();

    state = newState;
  }
  


  /*void addToFav(int index, List<Books> data) {
    data[index].isFavorite = true;
    final result = data.where((element) => element.isFavorite == true).toList();
    favoriteBooks = [...result];
  }

  void removeFromFav(int id) {
    for (final item in favoriteBooks) {
      if (item.id == id) {
        item.isFavorite = false;
      }
    }
    final result =
        favoriteBooks.where((element) => element.isFavorite == true).toList();
    favoriteBooks = [...result];
  }*/
}
