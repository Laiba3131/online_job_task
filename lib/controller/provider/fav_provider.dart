import 'package:flutter/material.dart';
import 'package:job_task/model/product_model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  bool isFavorite(Product product) => _favorites.contains(product);

  void toggleFavoriteStatus(Product product) {
    if (isFavorite(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }
}
