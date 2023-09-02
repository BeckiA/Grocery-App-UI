import 'package:grocery_app/models/category.dart';

class CartItem {
  Categories catergory;
  int units;

  CartItem({required this.catergory, this.units = 0});
}
