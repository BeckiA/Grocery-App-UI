import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/subcategory.dart';
import '../widgets/mainappbar.dart';

class DetailsScreen extends StatelessWidget {
  // SubCategory subCategory;
  // DetailsScreen({required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text("this.subCategory.name"),
      ),
    );
  }
}
