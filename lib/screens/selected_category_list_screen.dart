import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/widgets/category_icon.dart';

import '../models/subcategory.dart';
import '../widgets/mainappbar.dart';
import 'details_screen.dart';

class SelectedCategoryScreen extends StatelessWidget {
  Categories selectedCategory;

  SelectedCategoryScreen({required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                    iconColor: selectedCategory.color,
                    iconName: selectedCategory.icon),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  selectedCategory.name,
                  style: TextStyle(color: selectedCategory.color, fontSize: 20),
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      selectedCategory.subCategories.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            subCategory: selectedCategory
                                                .subCategories[index],
                                          )));
                            },
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/imgs/' +
                                        selectedCategory
                                            .subCategories[index].imgName +
                                        '.png',
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  selectedCategory.subCategories[index].name,
                                  style:
                                      TextStyle(color: selectedCategory.color),
                                )
                              ],
                            ),
                          ))),
            ),
          ],
        ),
      ),
    );
  }
}
