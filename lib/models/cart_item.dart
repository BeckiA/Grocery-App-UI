import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/subcategory.dart';

class CartItem {
  SubCategory catergory;
  int units;

  CartItem({required this.catergory, this.units = 0});
}
