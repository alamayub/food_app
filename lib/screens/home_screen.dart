import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/category/category_bloc.dart';
import 'package:food_app/blocs/restaurant/restaurant_bloc.dart';
import 'package:food_app/blocs/restaurant/restaurant_state.dart';
import 'package:food_app/models/promo_mode.dart';
import 'package:food_app/widgets/category_box.dart';
import 'package:food_app/widgets/food_search_box.dart';
import 'package:food_app/widgets/promo_box.dart';
import 'package:food_app/widgets/restaurant/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // category list
          SizedBox(
            height: 115,
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoryLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => CategoryBox(
                      category: state.categories[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                  );
                } else {
                  return const Center(child: Text('Somthing went wrong!'));
                }
              },
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
              itemCount: Promo.promos.length,
              itemBuilder: (context, index) => PromoBox(
                promo: Promo.promos[index],
              ),
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
          BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              if (state is RestaurantLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RestaurantLoaded) {
                return ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  itemCount: state.restaurants.length,
                  itemBuilder: (context, index) => RestaurantCard(
                    restaurant: state.restaurants[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                );
              } else {
                return const Center(child: Text('Somthing went wrong!'));
              }
            },
          )
        ],
      ),
    );
  }
}
