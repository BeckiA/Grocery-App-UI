import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../helpers/appcolors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: const [
              Icon(
                Icons.settings,
                color: AppColors.MAIN_COLOR,
              ),
              SizedBox(width: 10),
              Text('Settings',
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
