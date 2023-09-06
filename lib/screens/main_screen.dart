import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/side_menu_bar.dart';
import 'package:grocery_app/screens/settings_screen.dart';
import 'package:grocery_app/screens/shoppping_list_screen.dart';
import 'package:grocery_app/services/category_selection_services.dart';
import 'package:provider/provider.dart';
import '../helpers/utils.dart';
import '../widgets/category_card.dart';
import '../widgets/category_bottom_bar.dart';
import '../widgets/mainappbar.dart';
import 'category_list_screen.dart';
import 'favorites_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Categories> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: SideMenuBar(),
        ),
        appBar: MainAppBar(),
        body: Container(
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                  child: Navigator(
                key: Utils.mainListNav,
                initialRoute: '/',
                onGenerateRoute: (RouteSettings settings) {
                  Widget page;
                  switch (settings.name) {
                    case '/':
                      page = CategoryListScreen();
                      break;
                    case '/main_screen/favorites_screen':
                      page = FavoritesScreen();
                      break;
                    case '/main_screen/shopping_list_screen':
                      page = ShoppingListScreen();
                      break;
                    case '/main_screen/settings_screen':
                      page = SettingsScreen();
                      break;
                    default:
                      page = CategoryListScreen();
                      break;
                  }
                  return PageRouteBuilder(
                      pageBuilder: (_, __, ___) => page,
                      transitionDuration: const Duration(seconds: 0));
                },
              )),
            ]),
            Positioned(
                bottom: 0, left: 0, right: 0, child: CategoryBottomBar()),
          ]),
        ));
  }
}
