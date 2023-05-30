import 'package:flutter/material.dart';

import '../middleware/connect.dart';

class CartProvider extends ChangeNotifier {
  List<ProductConstructor> cartStore = [];

  void addToCart(ProductConstructor product) {
    cartStore.add(product);
    notifyListeners();
  }

  void removeItemFromCart(ProductConstructor item) {
    cartStore.remove(item);
    notifyListeners();
  }

  void clearCart() {
    cartStore.clear();
    notifyListeners();
  }
}
