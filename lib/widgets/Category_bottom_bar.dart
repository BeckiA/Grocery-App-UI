import 'package:flutter/material.dart';

import '../helpers/appcolors.dart';

class CategoryBottomBar extends StatelessWidget {
  const CategoryBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.favorite),
                color: AppColors.MAIN_COLOR,
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: AppColors.MAIN_COLOR,
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.pin_drop),
                color: AppColors.MAIN_COLOR,
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.settings),
                color: AppColors.MAIN_COLOR,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
