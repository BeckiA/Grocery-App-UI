import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/utils.dart';
import 'package:grocery_app/models/subcategory.dart';
import 'package:grocery_app/screens/category_list_screen.dart';
import 'package:grocery_app/screens/details_screen.dart';
import 'package:grocery_app/screens/main_screen.dart';
import 'package:grocery_app/screens/onboarding_screen.dart';
import 'package:grocery_app/screens/selected_category_list_screen.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:grocery_app/services/login_service.dart';
import 'package:provider/provider.dart';

void main() {
  SubCategory subCategory;
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => LoginService()),
      ChangeNotifierProvider(
        create: (context) => CategorySelectionServices(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartService(),
      )
    ],
    child: MaterialApp(
      navigatorKey: Utils.mainAppNav,
      theme: ThemeData(fontFamily: "Raleway"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(duration: 3, goToPage: WelcomeScreen()),
        '/welcomescreen': (context) => WelcomeScreen(),
        '/main_screen': (context) => MainScreen(),
        '/selectedCategoryScreen': (context) => SelectedCategoryScreen(),
        '/detailsScreen': (context) => DetailsScreen(),
        '/onboardingScreen': (context) => const OnboardingScreen(),
      },
    ),
  ));
}
