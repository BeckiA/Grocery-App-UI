import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/categorypart.dart';
import '../models/subcategory.dart';

class CategoryPartList extends StatefulWidget {
  SubCategory subCategory;
  CategoryPartList({required this.subCategory});

  @override
  State<CategoryPartList> createState() => _CategoryPartListState();
}

class _CategoryPartListState extends State<CategoryPartList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.subCategory.parts.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.subCategory.parts.forEach((CategoryPart part) {
                        part.isSelected =
                            widget.subCategory.parts[index] == part;
                      });
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                            border: widget.subCategory.parts[index].isSelected
                                ? Border.all(
                                    color: widget.subCategory.color, width: 4)
                                : null,
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage('assets/imgs/' +
                                    widget.subCategory.parts[index].imgName +
                                    '.png'),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset.zero,
                                  blurRadius: 10)
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: Text(
                          widget.subCategory.parts[index].name,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: widget.subCategory.color),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
