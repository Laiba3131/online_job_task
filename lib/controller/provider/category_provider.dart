import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_task/model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

Future<void> fetchCategories() async {
  _isLoading = true;
  notifyListeners();

  final response = await http.get(Uri.parse('https://dummyjson.com/products/categories'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);

    _categories = data.map((category) {
      String categoryName = category['name'] ?? '';

      return CategoryModel(
        name: categoryName.isNotEmpty 
            ? categoryName[0].toUpperCase() + categoryName.substring(1)
            : categoryName, 
        slug: category['slug'], 
        url: category['url'],  
      );
    }).toList();

    _isLoading = false;
    notifyListeners();
  } else {
    _isLoading = false;
    notifyListeners();
    throw Exception('Failed to load categories');
  }
}

}