import 'package:grocery_app/helpers/icon_helper.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/subcategory.dart';

import '../models/categorypart.dart';
import '../models/onboarding_content.dart';
import 'appcolors.dart';

class Utils {
  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Productos\nfrescos, de la\ntierra a su mesa',
          img: 'onboard1'),
      OnboardingContent(
          message: 'Carnes y embutidos\nfrescos y saludables\npara su deleite',
          img: 'onboard2'),
      OnboardingContent(
          message: 'Adquiéralos desde\nla comodidad de su\ndispositivo móbil',
          img: 'onboard3')
    ];
  }

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
                parts: [
                  CategoryPart(
                      name: 'Jamon', imgName: 'cat1_1_p1', isSelected: false),
                  CategoryPart(
                      name: 'Patas', imgName: 'cat1_1_p2', isSelected: false),
                  CategoryPart(
                      name: 'Tocineta',
                      imgName: 'cat1_1_p3',
                      isSelected: false),
                  CategoryPart(
                      name: 'Lomo', imgName: 'cat1_1_p4', isSelected: false),
                  CategoryPart(
                      name: 'Costillas',
                      imgName: 'cat1_1_p5',
                      isSelected: false),
                  CategoryPart(
                      name: 'Panza', imgName: 'cat1_1_p6', isSelected: false)
                ]),
            SubCategory(
                name: "Vaca",
                imgName: "cat1_2",
                icon: IconHelper.MEATS,
                color: AppColors.MEATS,
                parts: [
                  CategoryPart(
                      name: 'Costilla',
                      imgName: 'cat1_3_p1',
                      isSelected: false),
                  CategoryPart(
                      name: 'Ribeye', imgName: 'cat1_3_p2', isSelected: false),
                  CategoryPart(
                      name: 'Sirloin', imgName: 'cat1_3_p3', isSelected: false),
                  CategoryPart(
                      name: 'Rabo', imgName: 'cat1_3_p4', isSelected: false),
                ]),
            SubCategory(
                name: "Gallina",
                imgName: "cat1_3",
                icon: IconHelper.MEATS,
                color: AppColors.MEATS,
                parts: [
                  CategoryPart(
                      name: 'Alitas', imgName: 'cat1_2_p1', isSelected: false),
                  CategoryPart(
                      name: 'Pechuga', imgName: 'cat1_2_p2', isSelected: false),
                  CategoryPart(
                      name: 'Muslo', imgName: 'cat1_2_p3', isSelected: false),
                  CategoryPart(
                      name: 'Patas', imgName: 'cat1_2_p4', isSelected: false),
                  CategoryPart(
                      name: 'Corazones',
                      imgName: 'cat1_2_p5',
                      isSelected: false),
                ]),
            SubCategory(
                name: "Pavo",
                imgName: "cat1_4",
                icon: IconHelper.MEATS,
                color: AppColors.MEATS,
                parts: [
                  CategoryPart(
                      name: 'Pechuga', imgName: 'cat1_4_p1', isSelected: false),
                  CategoryPart(
                      name: 'Muslo', imgName: 'cat1_4_p2', isSelected: false),
                  CategoryPart(
                      name: 'Alas', imgName: 'cat1_4_p3', isSelected: false)
                ]),
            SubCategory(
                name: "Chivo",
                imgName: "cat1_5",
                icon: IconHelper.MEATS,
                color: AppColors.MEATS,
                parts: [
                  CategoryPart(
                      name: 'Chuletas',
                      imgName: 'cat1_5_p1',
                      isSelected: false),
                  CategoryPart(
                      name: 'Lomo', imgName: 'cat1_5_p2', isSelected: false),
                  CategoryPart(
                      name: 'Pierna', imgName: 'cat1_5_p3', isSelected: false)
                ]),
            SubCategory(
                name: "Conejo",
                imgName: "cat1_6",
                icon: IconHelper.MEATS,
                color: AppColors.MEATS,
                parts: [
                  CategoryPart(
                      name: 'Lomo', imgName: 'cat1_6_p1', isSelected: false),
                  CategoryPart(
                      name: 'Pierna', imgName: 'cat1_6_p2', isSelected: false)
                ])
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
