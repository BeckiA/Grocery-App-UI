import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import '../models/subcategory.dart';

class CategorySelectionServices extends ChangeNotifier {
  late Categories _selectedCategory;
  late SubCategory _selectedSubCategory;

  Categories get selectedCategory => _selectedCategory;
  set selectedCategory(Categories value) {
    _selectedCategory = value;
    notifyListeners();
  }

  SubCategory get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
    notifyListeners();
  }
}
