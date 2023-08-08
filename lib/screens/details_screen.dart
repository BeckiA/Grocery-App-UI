import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/appcolors.dart';
import 'package:grocery_app/models/categorypart.dart';
import 'package:grocery_app/widgets/category_icon.dart';
import '../models/subcategory.dart';
import '../widgets/mainappbar.dart';

class DetailsScreen extends StatefulWidget {
  SubCategory subCategory;
  DetailsScreen({required this.subCategory});
  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: ,
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
                            'assets/imgs' +
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text('Select the part you want.'),
                ),
                Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.subCategory.parts.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.subCategory.parts
                                      .forEach((CategoryPart part) {
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
                                        border: widget.subCategory.parts[index]
                                                .isSelected
                                            ? Border.all(
                                                color: widget.subCategory.color,
                                                width: 2)
                                            : null,
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage('assets/imgs/' +
                                                widget.subCategory.parts[index]
                                                    .imgName +
                                                '.png'),
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              offset: Offset.zero,
                                              blurRadius: 10)
                                        ]),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 25),
                                    child: Text(
                                      widget.subCategory.parts[index].name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: widget.subCategory.color),
                                    ),
                                  )
                                ],
                              ),
                            ))),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: 'Unit: '),
                        TextSpan(
                            text: 'Pound',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' (max. 20)', style: TextStyle(fontSize: 12))
                      ])),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
