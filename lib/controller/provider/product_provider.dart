
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_task/model/product_model.dart';
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  List<Product> favoriteProducts = [];

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _products = (data['products'] as List).map((item) => Product.fromJson(item)).toList();
    }
    _isLoading = false;
    notifyListeners();
  }

    Product? getProductById(int id) {
    return products.firstWhere((product) => product.id == id,);
  }

  void toggleFavoriteStatus(Product product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return favoriteProducts.contains(product);
  }
}
