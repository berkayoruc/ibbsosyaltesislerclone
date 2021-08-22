import 'package:flutter/material.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';
import '../widgets/active_icon.dart';

import 'meals.dart';
import 'menu.dart';
import 'map.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageOptions = [
    MapPage(),
    MenuPage(),
    MealsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
      child: SafeArea(
        child: Scaffold(
            body: _pageOptions[_currentPage],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[700],
              currentIndex: _currentPage,
              onTap: (_) => setState(() => _currentPage = _),
              items: [
                BottomNavigationBarItem(
                    activeIcon: ActiveIcon(
                      size: 36,
                      backgroundColor: Constants.primaryColor,
                      borderRadius: 8,
                    ),
                    icon: Icon(Icons.home_filled),
                    label: 'Tesisler'),
                BottomNavigationBarItem(
                    activeIcon: ActiveIcon(
                      size: 36,
                      backgroundColor: Constants.primaryColor,
                      borderRadius: 8,
                      iconData: Icons.menu_book,
                    ),
                    icon: Icon(Icons.menu_book),
                    label: 'Menüler'),
                BottomNavigationBarItem(
                    activeIcon: ActiveIcon(
                      size: 36,
                      backgroundColor: Constants.primaryColor,
                      borderRadius: 8,
                      iconData: Icons.restaurant_menu,
                    ),
                    icon: Icon(Icons.restaurant_menu),
                    label: 'Spesiyaller'),
                BottomNavigationBarItem(
                    activeIcon: ActiveIcon(
                      size: 36,
                      backgroundColor: Constants.primaryColor,
                      borderRadius: 8,
                      iconData: Icons.settings,
                    ),
                    icon: Icon(Icons.settings),
                    label: 'Diğer'),
              ],
            )),
      ),
    );
  }
}
