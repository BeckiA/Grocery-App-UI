import 'package:flutter/material.dart';

class Categories {
  String name;
  String icon;
  Color color;
  String imgName;
  List<Categories> subCategories;
  Categories({
    required this.name,
    required this.icon,
    required this.color,
    required this.imgName,
    required this.subCategories,
  });
}
