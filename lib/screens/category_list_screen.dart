import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/side_menu_bar.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:provider/provider.dart';
import '../helpers/utils.dart';
import '../widgets/category_card.dart';
import '../widgets/category_bottom_bar.dart';
import '../widgets/mainappbar.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});
  List<Categories> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    CategorySelectionServices catSelection =
        Provider.of(context, listen: false);

    return Scaffold(
        drawer: Drawer(
          child: SideMenuBar(),
        ),
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
                              catSelection.selectedCategory =
                                  this.categories[index];
                              Navigator.of(context)
                                  .pushNamed('/selectedCategoryScreen');
                            });
                      }))
            ]),
            Positioned(
                bottom: 0, left: 0, right: 0, child: CategoryBottomBar()),
          ]),
        ));
  }
}
