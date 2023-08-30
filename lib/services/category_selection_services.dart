import 'package:grocery_app/models/category.dart';
import '../models/subcategory.dart';

class CategorySelectionServices {
  late Categories _selectedCategory;
  late SubCategory _selectedSubCategory;

  Categories get selectedCategory => _selectedCategory;
  set selectedCategory(Categories value) {
    _selectedCategory = value;
  }

  SubCategory get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
  }
}
