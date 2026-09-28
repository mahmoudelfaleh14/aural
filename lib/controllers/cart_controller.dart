import 'package:aural/models/product.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final Map<Product, int> _cart = {};

  Map<Product, int> get cart => _cart;

  int get totalItems {
    int total = 0;

    for (final quantity in _cart.values) {
      total += quantity;
    }

    return total;
  }

  double get subtotal {
    double total = 0;

    for (final entry in _cart.entries) {
      final price = double.tryParse(entry.key.price) ?? 0;
      total += price * entry.value;
    }

    return total;
  }

  double get shipping {
    if (_cart.isEmpty) {
      return 0;
    }

    return subtotal >= 100 ? 0 : 10;
  }

  double get total {
    return subtotal + shipping;
  }

  void addToCart(Product product) {
    if (_cart.containsKey(product)) {
      _cart[product] = _cart[product]! + 1;
    } else {
      _cart[product] = 1;
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);

    notifyListeners();
  }

  void increaseQuantity(Product product) {
    if (_cart.containsKey(product)) {
      _cart[product] = _cart[product]! + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    if (!_cart.containsKey(product)) {
      return;
    }

    if (_cart[product]! > 1) {
      _cart[product] = _cart[product]! - 1;
    } else {
      _cart.remove(product);
    }

    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}