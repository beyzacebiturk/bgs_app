import 'package:bgs_app/models/books.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteBooksNotifier extends StateNotifier<List<Books>> {
  FavoriteBooksNotifier() : super([]);

  bool toggleBookFavoriteStatus(Books book) {
    final bookIsFavorite = state.contains(book);

    if (bookIsFavorite) {
      state = state.where((b) => b.id != book.id).toList();
      return false;
    } else {
      state = [...state, book];
      return true;
    }
  }
}

final favoriteBooksProvider =
    StateNotifierProvider<FavoriteBooksNotifier, List<Books>>((ref) {
  return FavoriteBooksNotifier();
});
