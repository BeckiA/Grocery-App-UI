import 'package:flutter/material.dart';

import '../helpers/appcolors.dart';
import '../helpers/icon_helper.dart';
import 'icon_font.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;
  MainAppBar({this.themeColor = AppColors.MAIN_COLOR});

  Size get preferredSize => const Size.fromHeight(80);
  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: IconFont(
          iconName: IconHelper.MAIN_LOGO, color: widget.themeColor, size: 40),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          child: ClipOval(child: Image.asset('assets/imgs/me.jpg')),
        )
      ],
    );
  }
}
