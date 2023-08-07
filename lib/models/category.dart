import 'package:flutter/material.dart';
import 'package:grocery_app/models/subcategory.dart';

class Categories {
  String name;
  String icon;
  Color color;
  String imgName;
  List<SubCategory> subCategories;
  Categories({
    required this.name,
    required this.icon,
    required this.color,
    required this.imgName,
    required this.subCategories,
  });
}
