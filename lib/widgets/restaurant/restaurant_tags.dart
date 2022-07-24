import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant_model.dart';

class RestaurantTags extends StatelessWidget {
  const RestaurantTags({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restaurant.categories
          .map(
            (tag) => restaurant.categories.indexOf(tag) ==
                    restaurant.categories.length - 1
                ? Text(
                    tag,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : Text(
                    '$tag, ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
          )
          .toList(),
    );
  }
}
