import 'dart:ui';

import 'package:grocery_app/models/category.dart';

class SubCategory extends Categories {
  SubCategory({
    required String name,
    required String icon,
    required Color color,
    required String imgName,
  }) : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            subCategories: []);
}
