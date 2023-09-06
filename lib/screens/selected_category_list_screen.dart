import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:grocery_app/widgets/category_icon.dart';
import 'package:provider/provider.dart';

import '../widgets/mainappbar.dart';

// ignore: must_be_immutable
class SelectedCategoryScreen extends StatelessWidget {
  late Categories selectedCategory;

  @override
  Widget build(BuildContext context) {
    CategorySelectionServices catSelection =
        Provider.of(context, listen: false);
    CartService cartService = Provider.of<CartService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
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
                            var subCat =
                                this.selectedCategory.subCategories[index];
                            catSelection.selectedSubCategory =
                                cartService.getCategoryFromCart(subCat);
                            Navigator.pushNamed(context, '/detailsScreen');
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
                                style: TextStyle(color: selectedCategory.color),
                              )
                            ],
                          ),
                        ))),
          ),
        ],
      ),
    );
  }
}
