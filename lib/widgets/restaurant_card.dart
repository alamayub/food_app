import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(restaurant.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 30,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Text(
                    '${restaurant.deliveryTime} min',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 4),
                Row(
                  children: restaurant.tags
                      .map(
                        (tag) => restaurant.tags.indexOf(tag) ==
                                restaurant.tags.length - 1
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
                ),
                const SizedBox(height: 4),
                Text(
                  '${restaurant.distance}km - ${restaurant.deliveryFee} delivery fee',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
