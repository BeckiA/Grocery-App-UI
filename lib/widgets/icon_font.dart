import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  String iconName;
  Color color;
  double size;
  IconFont({required this.iconName, required this.color, required this.size});
  Widget build(BuildContext context) {
    return Text(
      iconName,
      style: TextStyle(color: color, fontSize: size, fontFamily: "orilla"),
    );
  }
}
