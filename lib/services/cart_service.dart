import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:grocery_app/models/subcategory.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  bool isSubCategoryAddedToCart(SubCategory cat) {
    return _items.length > 0
        ? _items.any((CartItem item) => item.catergory.name == cat.name)
        : false;
  }
}
