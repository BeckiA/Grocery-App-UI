import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/subcategory.dart';
import 'package:grocery_app/screens/category_list_screen.dart';
import 'package:grocery_app/screens/details_screen.dart';
import 'package:grocery_app/screens/onboarding_screen.dart';
import 'package:grocery_app/screens/selected_category_list_screen.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:grocery_app/services/login_service.dart';
import 'package:provider/provider.dart';

void main() {
  SubCategory subCategory;
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => LoginService()),
      Provider(
        create: (context) => CategorySelectionServices(),
      )
    ],
    child: MaterialApp(
      theme: ThemeData(fontFamily: "Raleway"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(duration: 3, goToPage: WelcomeScreen()),
        '/welcomescreen': (context) => WelcomeScreen(),
        '/categoryListScreen': (context) => CategoryListScreen(),
        '/selectedCategoryScreen': (context) => SelectedCategoryScreen(),
        '/detailsScreen': (context) => DetailsScreen(),
        '/onboardingScreen': (context) => const OnboardingScreen(),
      },
    ),
  ));
}
