import 'package:bgs_app/models/books.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = StateNotifierProvider<FavoriteListState, List<Books>>(
  (ref) {
    return FavoriteListState();
  },
);

class FavoriteListState extends StateNotifier<List<Books>> {
  FavoriteListState() : super(books);

  void setFavorite(int id, bool isFavorite) {
    var newState = state.map(
      (p) {
        if (p.id == id) {
          return p.copywith(isFavorite: isFavorite);
        } else {
          return p;
        }
      },
    ).toList();

    state = newState;
  }
}
