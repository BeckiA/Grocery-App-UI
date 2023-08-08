import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/utils.dart';
import 'package:grocery_app/models/subcategory.dart';
import 'package:grocery_app/screens/category_list_screen.dart';
import 'package:grocery_app/screens/details_screen.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Raleway"),
    debugShowCheckedModeBanner: false,
    // home: SplashScreen(duration: 3, goToPage: WelcomeScreen()),
    home: DetailsScreen(
        subCategory: Utils.getMockedCategories()[0].subCategories[0]),
  ));
}
