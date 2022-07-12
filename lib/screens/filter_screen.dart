import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filters/filter_bloc.dart';
import 'package:food_app/blocs/filters/filter_event.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/screens/restaurant_list_screen.dart';
import 'package:food_app/widgets/custom_category_filter.dart';
import 'package:food_app/widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/filter';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('filter Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            const CustomPriceFilter(),
            const SizedBox(height: 16),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            const CustomcategoryFilter()
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            if (state is FilterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FilterLoaded) {
              return MaterialButton(
                height: 50,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  var categories = state.filter.categoryFilter
                      .where((x) => x.value)
                      .map((filter) => filter.category.name)
                      .toList();

                  var prices = state.filter.priceFilter
                      .where((x) => x.value)
                      .map((filter) => filter.price.price)
                      .toList();

                  List<Restaurant> restaurants = Restaurant.restaurants
                      .where((r) => categories.any((c) => r.tags.contains(c)))
                      .where(
                          (r) => prices.any((c) => r.priceCategory.contains(c)))
                      .toList();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          RestaurantListScreen(lists: restaurants)));
                },
                child: const Text('Apply'),
              );
            } else {
              return const Text('Somethign went wrong!');
            }
          },
        ),
      ),
    );
  }
}
