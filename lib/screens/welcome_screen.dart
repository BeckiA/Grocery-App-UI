import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/appcolors.dart';
import 'package:grocery_app/screens/onboarding_screen.dart';
import 'package:grocery_app/widgets/theme_button.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/sizings.dart';
import '../screens/category_list_screen.dart';
import '../helpers/icon_helper.dart';
import '../widgets/icon_font.dart';

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              WelcomeImage,
              fit: BoxFit.cover,
            ),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      width: 175,
                      height: 175,
                      color: GAPrimaryColor,
                      alignment: Alignment.center,
                      child: IconFont(
                        iconName: IconHelper.MAIN_LOGO,
                        color: Colors.white,
                        size: 130,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Bienvenido',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Productos Frescos, \n Saludables. A Tiempo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ThemeButton(
                  label: 'SIGNUP',
                  icon: Text(''),
                  onClick: () {},
                  color: AppColors.MAIN_COLOR,
                ),
                ThemeButton(
                    label: 'TO ONBOARDING',
                    icon: Text(''),
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingScreen(),
                          ));
                    })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
