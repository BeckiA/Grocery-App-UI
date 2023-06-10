import 'package:flutter/material.dart';

import 'helpers/icon_helper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: WelcomeScreen()),
  ));
}

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

class SplashPage extends StatelessWidget {
  int duration = 0;
  late Widget goToPage;
  SplashPage({required this.duration, required this.goToPage});
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

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
