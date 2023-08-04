import 'package:flutter/material.dart';

import '../models/category.dart';
import 'icon_font.dart';

class CategoryIcon extends StatelessWidget {
  Color iconColor;
  String iconName;
  double size;

  CategoryIcon(
      {required this.iconColor, required this.iconName, this.size = 30});
  late List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: iconColor,
        child:
            IconFont(iconName: iconName, color: Colors.white, size: this.size),
      ),
    );
  }
}
