import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import 'category_icon.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.category, required this.onCardClick});
  Categories category;
  Function onCardClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCardClick(),
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Image.asset(
                    'assets/imgs/' + this.category.imgName + '.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ])),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CategoryIcon(
                      iconColor: category.color,
                      iconName: category.icon,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      category.name,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
