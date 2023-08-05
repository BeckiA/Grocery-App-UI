import 'package:flutter/foundation.dart';
import 'package:grocery_app/helpers/icon_helper.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/subcategory.dart';

import 'appcolors.dart';

class Utils {
  static List<Categories> getMockedCategories() {
    return [
      Categories(
          color: AppColors.MEATS,
          icon: IconHelper.MEATS,
          imgName: 'cat1',
          name: 'Carnes',
          subCategories: [
            SubCategory(
              color: AppColors.MEATS,
              name: "Cerdo",
              imgName: "cat1_1",
              icon: IconHelper.MEATS,
            ),
            SubCategory(
              name: "Vaca",
              imgName: "cat1_2",
              icon: IconHelper.MEATS,
              color: AppColors.MEATS,
            ),
            SubCategory(
              name: "Gallina",
              imgName: "cat1_3",
              icon: IconHelper.MEATS,
              color: AppColors.MEATS,
            ),
            SubCategory(
              name: "Pavo",
              imgName: "cat1_4",
              icon: IconHelper.MEATS,
              color: AppColors.MEATS,
            ),
            SubCategory(
              name: "Chivo",
              imgName: "cat1_5",
              icon: IconHelper.MEATS,
              color: AppColors.MEATS,
            ),
            SubCategory(
              name: "Conejo",
              imgName: "cat1_6",
              icon: IconHelper.MEATS,
              color: AppColors.MEATS,
            )
          ]),
      Categories(
          color: AppColors.FRUITS,
          icon: IconHelper.FRUITS,
          imgName: 'cat2',
          name: 'Fruits',
          subCategories: []),
      Categories(
          color: AppColors.VEGS,
          icon: IconHelper.VEGS,
          imgName: 'cat3',
          name: 'Vegetables',
          subCategories: []),
      Categories(
          color: AppColors.SEEDS,
          icon: IconHelper.SEEDS,
          imgName: 'cat4',
          name: 'Semillas',
          subCategories: []),
      Categories(
          color: AppColors.PASTRIES,
          icon: IconHelper.PASTRIES,
          imgName: 'cat5',
          name: 'Dulces',
          subCategories: []),
      Categories(
          color: AppColors.SPICES,
          icon: IconHelper.SPICES,
          imgName: 'cat6',
          name: 'Especies',
          subCategories: []),
    ];
  }
}
