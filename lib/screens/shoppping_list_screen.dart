import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/appcolors.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import '../models/cart_item.dart';
import '../models/subcategory.dart';
import '../services/cart_service.dart';
import '../widgets/icon_font.dart';

class ShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartService cartService = Provider.of<CartService>(context, listen: false);

    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: [
              const Icon(
                Icons.shopping_cart,
                color: AppColors.MAIN_COLOR,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text('TO Cart',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      cartService.removeAll();
                    },
                    child: Container(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.MAIN_COLOR.withOpacity(0.2)),
                        child: Row(
                          children: const [
                            Icon(Icons.delete, color: AppColors.DARK_GREEN),
                            SizedBox(width: 5),
                            Text('Borrar Todo',
                                style: TextStyle(
                                    color: AppColors.DARK_GREEN, fontSize: 12)),
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
          Expanded(child: Consumer<CartService>(
            builder: (context, cart, child) {
              List<Widget> cartItems = [];
              double mainTotal = 0;

              if (cart.items.isNotEmpty) {
                // mainTotal = cart.getShoppingCartTotalPrice();

                cart.items.forEach((CartItem item) {
                  SubCategory itemSubCategory = (item.catergory as SubCategory);
                  // double total = itemSubCategory.getTotalPrice();
                  double total = itemSubCategory.amount * itemSubCategory.price;
                  mainTotal += total;

                  cartItems.add(Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset.zero)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                                './assets/imgs/' +
                                    itemSubCategory.imgName +
                                    '.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(itemSubCategory.name,
                                    style: TextStyle(
                                        color: itemSubCategory.color)),
                                Text(
                                    '${itemSubCategory.amount.toString()} ${Utils.weightUnitToString(itemSubCategory.unit)} (\$${itemSubCategory.price.toStringAsFixed(2)} per ${Utils.weightUnitToString(itemSubCategory.unit)})',
                                    style: const TextStyle(color: Colors.grey)),
                                Text('\$${total.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        color: itemSubCategory.color,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                cart.remove(item);
                              },
                              icon: const Icon(Icons.highlight_off,
                                  size: 30, color: AppColors.MAIN_COLOR))
                        ],
                      )));
                });

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.575,
                      child: Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) => cartItems[index],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconFont(
                                  iconName: IconHelper.LOGO,
                                  color: AppColors.MAIN_COLOR,
                                  size: 40),
                              const SizedBox(width: 10),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text:
                                        'Total: \$${mainTotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        color: AppColors.MAIN_COLOR,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25))
                              ]))
                            ],
                          )),
                    ),
                  ],
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconFont(
                          iconName: IconHelper.LOGO,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: 2,
                          height: 50,
                          color: Colors.grey[400],
                        ),
                        Text('Your cart has no items.\nAdd some.',
                            style: TextStyle(color: Colors.grey[400]))
                      ],
                    ),
                  ),
                );
              }
            },
          ))
        ]));
  }
}
