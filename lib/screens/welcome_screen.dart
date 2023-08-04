import 'package:flutter/material.dart';
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
                Padding(
                  padding: const EdgeInsets.all(GAButtonRadius),
                  child: InkWell(
                    splashColor: GAPrimaryColor.withOpacity(0.2),
                    highlightColor: GAPrimaryColor.withOpacity(0.2),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryListScreen(),
                              ));
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: GAPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(GAButtonRadius))),
                        child: const Text(
                          "SIGNUP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    splashColor: GAPrimaryColor.withOpacity(0.2),
                    highlightColor: GAPrimaryColor.withOpacity(0.2),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button's onPress logic here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(GAButtonRadius)),
                        backgroundColor: Colors
                            .transparent, // Set a transparent background color
                        side: const BorderSide(
                            color: GAPrimaryColor, width: 2), // Add a border
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: GAPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
