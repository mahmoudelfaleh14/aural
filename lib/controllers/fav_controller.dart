import 'package:aural/models/product.dart';
import 'package:flutter/material.dart';

class FavoritesController extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }

  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }

    notifyListeners();
  }

  void removeFavorite(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}