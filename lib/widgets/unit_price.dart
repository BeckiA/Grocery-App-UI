import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';
import '../constants/sizings.dart';
import '../helpers/appcolors.dart';

class UnitPrice extends StatefulWidget {
  int amount = 0;
  double price = 15.0;
  double cost = 0.0;
  // const UnitPrice({super.key});

  @override
  State<UnitPrice> createState() => _UnitPriceState();
}

class _UnitPriceState extends State<UnitPrice> {
  @override
  Widget build(BuildContext context) {
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
                  widget.amount < 20
                      ? setState(() {
                          widget.amount++;

                          widget.cost = widget.price * widget.amount;
                        })
                      : null;
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 50,
                  color: AppColors.MEATS,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: widget.amount.toString(),
                          style: const TextStyle(fontSize: 40)),
                      const TextSpan(
                          text: 'lbs', style: TextStyle(fontSize: 20))
                    ])),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Decrement
                  widget.amount > 0
                      ? setState(() {
                          widget.amount--;
                          widget.cost = widget.price * widget.amount;
                        })
                      : null;
                },
                child: const Icon(
                  Icons.remove_circle_outline,
                  size: 50,
                  color: Colors.grey,
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
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              Text(
                '\$${widget.cost}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
