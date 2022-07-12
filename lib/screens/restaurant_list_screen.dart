import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/widgets/restaurant_card.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<Restaurant> lists;
  const RestaurantListScreen({
    Key? key,
    required this.lists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Restaurants'),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        itemBuilder: (context, index) =>
            RestaurantCard(restaurant: lists[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: lists.length,
      ),
    );
  }
}
