import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/appcolors.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import '../services/login_service.dart';
import '../widgets/icon_font.dart';

class SideMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    bool userLoggedIn = loginService.loggedInUserModel != null;

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(50),
            color: AppColors.MAIN_COLOR,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextButton(
                        onPressed: () async {
                          if (userLoggedIn) {
                            loginService.signOut();
                            Utils.mainAppNav.currentState!
                                .pushReplacementNamed('/welcomescreen');
                          } else {
                            bool success =
                                await loginService.signInWithGoogle();
                            if (success) {
                              Utils.mainAppNav.currentState!
                                  .pushNamed('/categoryListScreen');
                            }
                          }
                        },
                        child: Row(
                          children: [
                            Icon(userLoggedIn ? Icons.logout : Icons.login,
                                color: Colors.white, size: 20),
                            const SizedBox(width: 10),
                            Text(userLoggedIn ? 'Sign Out' : 'Sign In',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        )),
                    const SizedBox(height: 10),
                    Visibility(
                        visible: !userLoggedIn,
                        child: TextButton(
                            onPressed: () async {
                              Utils.mainAppNav.currentState!
                                  .pushNamed('/welcomepage');
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.home, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text('Welcome',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ],
                            )))
                  ],
                ),
                IconFont(
                    iconName: IconHelper.LOGO, size: 70, color: Colors.white)
              ],
            )));
  }
}
