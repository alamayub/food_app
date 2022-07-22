import 'package:flutter/material.dart';
import 'package:food_app/screens/cart_screen.dart';
import 'package:food_app/screens/favourite_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/order_screen.dart';
import 'package:food_app/screens/profile_screen.dart';
import 'package:food_app/widgets/custom_appbar.dart';

class Toeato extends StatefulWidget {
  const Toeato({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ToeatoState createState() => _ToeatoState();
}

class _ToeatoState extends State<Toeato> {
  int _currentIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _changeIndex(int index) {
    setState(() => _currentIndex = index);
    pageController.jumpToPage(index);
  }

  static const pageItems = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          _changeIndex(0);
          return false;
        } else {
          Navigator.of(context).pop();
          return true;
        }
      },
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: _changeIndex,
          children: pageItems,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _changeIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(
                  _currentIndex == 1 ? Icons.favorite : Icons.favorite_outline),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(_currentIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(_currentIndex == 3
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                  _currentIndex == 4 ? Icons.person : Icons.person_outlined),
            )
          ],
          selectedIconTheme: const IconThemeData(size: 20),
          unselectedIconTheme: const IconThemeData(size: 18),
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
