import 'package:flutter/material.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/widgets/category_box.dart';
import 'package:food_app/widgets/food_search_box.dart';
import 'package:food_app/widgets/promo_box.dart';
import 'package:food_app/widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // category list
            SizedBox(
              height: 115,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Category.categories.length,
                itemBuilder: (context, index) => CategoryBox(
                  category: Category.categories[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
            // promobox list
            SizedBox(
              height: 150,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Category.categories.length,
                itemBuilder: (context, index) => const PromoBox(),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),

            // food search box
            const FoodSearchBox(),

            // top rated restaurants
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: Restaurant.restaurants.length,
              itemBuilder: (context, index) => RestaurantCard(
                restaurant: Restaurant.restaurants[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.person),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CURRENT LOCATION',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          Text(
            'Panitanki-10, Birgunj',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
