import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/appcolors.dart';
import '../services/cart_service.dart';

class CategoryBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero)
        ]),
        height: 100,
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: const Icon(Icons.favorite, color: AppColors.MAIN_COLOR),
                  onPressed: () {},
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                    color: Colors.white,
                    child: InkWell(
                        splashColor: Colors.grey[100],
                        highlightColor: Colors.grey[100],
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Consumer<CartService>(
                              builder: (context, cart, child) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.shopping_cart,
                                        color: AppColors.MAIN_COLOR),
                                    Visibility(
                                      visible: cart.items.isNotEmpty,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                            cart.items.length.toString(),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: AppColors.MAIN_COLOR)),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ))))),
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: const Icon(Icons.pin_drop, color: AppColors.MAIN_COLOR),
                  onPressed: () {},
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: const Icon(Icons.settings, color: AppColors.MAIN_COLOR),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ));
  }
}
