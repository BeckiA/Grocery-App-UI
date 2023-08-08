import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/categorypart.dart';

class SubCategory extends Categories {
  List<CategoryPart> parts;
  SubCategory({
    required String name,
    required String icon,
    required Color color,
    required String imgName,
    required this.parts,
  }) : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            subCategories: []);
}
