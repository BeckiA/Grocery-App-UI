import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/user_profile_header.dart';

import '../helpers/appcolors.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import 'icon_font.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool showProfilePic;
  Color themeColor;
  MainAppBar(
      {this.themeColor = AppColors.MAIN_COLOR, this.showProfilePic = true});

  Size get preferredSize => const Size.fromHeight(80);
  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          NavigatorState navigator = Utils.mainAppNav as NavigatorState;
          if (navigator.canPop()) {
            navigator
                .popUntil((route) => route.settings.name == '/main_screen');
          } else {
            // If there are no routes to pop, you might consider pushing '/categoryListScreen' instead
            navigator.pushNamed('/main_screen');
          }
        },
        child: IconFont(
            iconName: IconHelper.MAIN_LOGO, color: widget.themeColor, size: 40),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [UserProfilePic(widget.showProfilePic)],
    );
  }
}
