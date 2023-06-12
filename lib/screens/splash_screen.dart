import 'package:flutter/material.dart';

import '../helpers/icon_helper.dart';
import '../widgets/icon_font.dart';

class SplashScreen extends StatelessWidget {
  int duration = 0;
  late Widget goToPage;
  SplashScreen({required this.duration, required this.goToPage});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: duration),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => goToPage,
            ));
      },
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xFF80C038),
        child:
            IconFont(iconName: IconHelper.LOGO, color: Colors.white, size: 100),
      ),
    );
  }
}
