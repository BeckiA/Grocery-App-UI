import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_app/helpers/appcolors.dart';
import 'package:grocery_app/helpers/icon_helper.dart';
import 'package:grocery_app/models/onboarding_content.dart';
import 'package:grocery_app/screens/category_list_screen.dart';
import 'package:grocery_app/widgets/icon_font.dart';
import 'package:grocery_app/widgets/mainappbar.dart';
import 'package:grocery_app/widgets/theme_button.dart';

import '../helpers/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  List<OnboardingContent> _content = Utils.getOnboarding();
  int pageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  pageIndex = page;
                });
              },
              children: List.generate(
                  _content.length,
                  (index) => Container(
                        padding: const EdgeInsets.all(60),
                        margin: const EdgeInsets.only(
                            left: 40, right: 40, top: 40, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.MAIN_COLOR.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: Offset.zero)
                            ]),
                        child: Column(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconFont(
                                      iconName: IconHelper.LOGO,
                                      color: AppColors.MAIN_COLOR,
                                      size: 40),
                                ),
                                Image.asset(
                                    'assets/imgs/${_content[index].img}.png'),
                                Text(
                                  _content[index].message,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.MAIN_COLOR,
                                      fontSize: 25),
                                )
                              ],
                            )),
                            Visibility(
                              visible: index == _content.length - 1,
                              child: ThemeButton(
                                label: "Entrar Ahora",
                                icon: Text(''),
                                onClick: () {},
                                color: AppColors.DARK_GREEN,
                                highlight: AppColors.DARKER_GREEN,
                              ),
                            )
                          ],
                        ),
                      )),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  _content.length,
                  (index) => GestureDetector(
                        onTap: () {
                          _controller.animateTo(
                              MediaQuery.of(context).size.width * index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.MAIN_COLOR,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 6,
                                  color: pageIndex == index
                                      ? Color(0xFFC1E05E)
                                      : Theme.of(context).canvasColor)),
                        ),
                      )),
            ),
            ThemeButton(
                label: "Saltar Onbaoarding", icon: Text(''), onClick: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryListScreen(),
                          ));
                })
          ],
        ),
      ),
    );
  }
}
