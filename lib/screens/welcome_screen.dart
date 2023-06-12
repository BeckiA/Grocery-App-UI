import 'package:flutter/material.dart';
import 'package:grocery_app/screens/category_list_screen.dart';

import '../helpers/icon_helper.dart';
import '../widgets/icon_font.dart';

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Opacity(
            opacity: 0.3,
            child: Positioned.fill(
                child: Image.asset(
              'assets/imgs/of_main_bg.png',
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: const Color(0xFF80C038),
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
                  height: 40,
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
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    splashColor: const Color(0xFF80C038).withOpacity(0.2),
                    highlightColor: const Color(0xFF80C038).withOpacity(0.2),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryListScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF80C038)),
                        child: const Text(
                          "SIGNUP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Material(
                  child: InkWell(
                    splashColor: const Color(0xFF80C038).withOpacity(0.2),
                    highlightColor: const Color(0xFF80C038).withOpacity(0.2),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button's onPress logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Set a transparent background color
                        side: const BorderSide(
                            color: Color(0xFF80C038), width: 2), // Add a border
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Color(0xFF80C038),
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
