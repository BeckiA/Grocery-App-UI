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

  void incrementSubCategoryAmount() {
    if (_selectedSubCategory != null) {
      _selectedSubCategory.amount++;
      notifyListeners();
    }
  }

  void decrementSubCategoryAmount() {
    if (_selectedSubCategory != null) {
      _selectedSubCategory.amount--;
      notifyListeners();
    }
  }

  int get subCategoryAmount {
    int subCatAmount = 0;
    if (_selectedSubCategory != null) {
      subCatAmount = _selectedSubCategory.amount;
    }
    return subCatAmount;
  }
}
