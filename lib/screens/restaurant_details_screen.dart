import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/screens/basket_screen.dart';
import 'package:food_app/widgets/restaurant_info.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Restaurant Details Screen'),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  image: NetworkImage(restaurant.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            RestaurantInfo(restaurant: restaurant),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          height: 50,
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const BasketScreen()));
          },
          child: const Text('Basket'),
        ),
      ),
    );
  }
}
