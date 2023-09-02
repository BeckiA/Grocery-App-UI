import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_app/models/subcategory.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/sizings.dart';
import '../helpers/appcolors.dart';
import '../helpers/unit_enums.dart';

const int MAX_VALUE = 20;
const int MIN_VALUE = 0;

class UnitPriceWidget extends StatefulWidget {
  Color themeColor;
  int amount = 0;
  double price = 0.0;
  WeightUnits unit;
  double cost = 0.0;

  UnitPriceWidget(
      {this.themeColor = AppColors.MAIN_COLOR,
      this.price = 0,
      this.unit = WeightUnits.Lb});

  @override
  State<UnitPriceWidget> createState() => _UnitPriceWidgetState();
}

class _UnitPriceWidgetState extends State<UnitPriceWidget> {
  @override
  Widget build(BuildContext context) {
    CategorySelectionServices catSelection =
        Provider.of(context)<CategorySelectionServices>(context);
    SubCategory subCategory = catSelection.selectedSubCategory;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Unit: '),
            TextSpan(
                text: 'Pound', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' (max. 20)', style: TextStyle(fontSize: 12))
          ])),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset.zero,
                    color: Colors.black.withOpacity(0.2))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  catSelection.selectedSubCategory.amount < MAX_VALUE
                      ? catSelection.selectedSubCategory.amount++
                      : null;
                  catSelection.selectedSubCategory =
                      catSelection.selectedSubCategory;
                },
                child: Icon(
                  Icons.add_circle_outline,
                  size: 50,
                  color: catSelection.selectedSubCategory.amount < MAX_VALUE
                      ? widget.themeColor
                      : widget.themeColor.withOpacity(0.2),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Consumer<CategorySelectionServices>(
                    builder: (context, cat, child) => Center(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: widget.amount.toString(),
                            style: const TextStyle(fontSize: 40)),
                        TextSpan(
                            // ignor e: unnecessary_null_comparison
                            text: catSelection.selectedSubCategory != null
                                ? catSelection.selectedSubCategory.amount
                                    .toString()
                                : '0',
                            style: const TextStyle(fontSize: 20))
                      ])),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Decrement
                  widget.amount > MIN_VALUE
                      ? catSelection.selectedSubCategory.amount--
                      : null;
                },
                child: Icon(
                  Icons.remove_circle_outline,
                  size: 50,
                  color: catSelection.selectedSubCategory.amount > MIN_VALUE
                      ? Colors.grey
                      : Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                const TextSpan(text: 'Price: '),
                TextSpan(
                    text: '\$${widget.price} / lb',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ])),
              Text(
                '\$${widget.cost}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
