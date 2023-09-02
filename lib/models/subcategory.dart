import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/categorypart.dart';

import '../helpers/unit_enums.dart';

class SubCategory extends Categories {
  List<CategoryPart> parts;
  double price;
  WeightUnits unit;
  int amount;
  SubCategory({
    required String name,
    required String icon,
    required Color color,
    required String imgName,
    this.price = 0.0,
    this.unit = WeightUnits.Lb,
    this.amount = 0,
    this.parts = const [],
  }) : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            subCategories: []);
}
