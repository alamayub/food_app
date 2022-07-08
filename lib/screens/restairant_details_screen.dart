import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({Key? key}) : super(key: key);

  static const String routeName = '/restaurant-details';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RestaurantDetailsScreen(),
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
