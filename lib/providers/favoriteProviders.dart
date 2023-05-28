import 'package:flutter/material.dart';

import '../middleware/connect.dart';

class FavoritesProvider extends ChangeNotifier {
  List<ProductConstructor> favoriteStore = [];
  void addToFavorite(ProductConstructor product) {
    favoriteStore.add(product);
    notifyListeners();
  }

  void removeFromFavorites(ProductConstructor item) {
    favoriteStore.remove(item);
    notifyListeners();
  }
}
