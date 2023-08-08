import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/appcolors.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/screens/selected_category_list_screen.dart';
import 'package:grocery_app/widgets/icon_font.dart';

import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import '../widgets/category_card.dart';
import '../widgets/category_bottom_bar.dart';
import '../widgets/mainappbar.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});
  List<Categories> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: MainAppBar(),
        body: Container(
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Select a Category",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  )),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return CategoryCard(
                            category: categories[index],
                            onCardClick: () {
                              // Will Get routed to the detail screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SelectedCategoryScreen(
                                            selectedCategory:
                                                categories[index]),
                                  ));
                            });
                      }))
            ]),
            const Positioned(
                bottom: 0, left: 0, right: 0, child: CategoryBottomBar()),
          ]),
        ));
  }
}
