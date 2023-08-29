import 'package:flutter/material.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/services/login_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
    create: (context) => LoginService(),
    child: MaterialApp(
      theme: ThemeData(fontFamily: "Raleway"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(duration: 3, goToPage: WelcomeScreen()),
    ),
  ));
}
