import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/appcolors.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:grocery_app/widgets/category_icon.dart';
import 'package:provider/provider.dart';
import '../models/subcategory.dart';
import '../widgets/category_part_list.dart';
import '../widgets/mainappbar.dart';
import '../widgets/theme_button.dart';
import '../widgets/unit_price.dart';

class DetailsScreen extends StatefulWidget {
  late SubCategory subCategory;

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    CategorySelectionServices catSelection =
        Provider.of<CategorySelectionServices>(context, listen: false);
    widget.subCategory = catSelection.selectedSubCategory;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/imgs/' +
                                  widget.subCategory.imgName +
                                  '_desc.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent
                    ])),
                  )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryIcon(
                            iconColor: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Pork",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: widget.subCategory.color,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: const Text(
                                  '\$50.00 / lb',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      top: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.MAIN_COLOR,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 20,
                                  offset: Offset.zero)
                            ]),
                      )),
                  MainAppBar(
                    themeColor: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
                    child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text('Select the part you want.'),
                ),
                CategoryPartList(subCategory: widget.subCategory),
                UnitPrice(),
                ThemeButton(
                  label: 'ADD TO CART',
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onClick: () {},
                ),
                ThemeButton(
                  label: "PRODUCT LOCATION",
                  icon: const Icon(
                    Icons.location_pin,
                    color: Colors.white,
                  ),
                  onClick: () {},
                  color: AppColors.DARKER_GREEN,
                  highlight: Colors.white,
                )
              ],
            )))
          ],
        ),
      ),
    );
  }
}
