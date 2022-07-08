import 'package:flutter/material.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({Key? key}) : super(key: key);

  static const String routeName = '/restaurant-list';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RestaurantListScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Details Screen'),
      ),
    );
  }
}
