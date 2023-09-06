import 'package:flutter/material.dart';
import '../helpers/appcolors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: const [
              Icon(
                Icons.favorite,
                color: AppColors.MAIN_COLOR,
              ),
              SizedBox(width: 10),
              Text('Favorites',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Expanded(
            child: Container(),
          )
        ]));
  }
}
