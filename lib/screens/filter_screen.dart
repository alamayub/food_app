import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_category_filter.dart';
import 'package:food_app/widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 10),
            const CustomPriceFilter(),
            const SizedBox(height: 16),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 10),
            const CustomcategoryFilter()
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: BlocBuilder<FilterBloc, FilterState>(
      //     builder: (context, state) {
      //       if (state is FilterLoading) {
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //       if (state is FilterLoaded) {
      //         return MaterialButton(
      //           height: 50,
      //           color: Theme.of(context).colorScheme.primary,
      //           onPressed: () {
      //             var categories = state.filter.categoryFilter
      //                 .where((x) => x.value)
      //                 .map((filter) => filter.category.name)
      //                 .toList();

      //             var prices = state.filter.priceFilter
      //                 .where((x) => x.value)
      //                 .map((filter) => filter.price.price)
      //                 .toList();

      //             List<Restaurant> restaurants = Restaurant.restaurants
      //                 .where((r) => categories.any((c) => r.tags.contains(c)))
      //                 .where(
      //                     (r) => prices.any((c) => r.priceCategory.contains(c)))
      //                 .toList();

      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) =>
      //                     RestaurantListScreen(lists: restaurants)));
      //           },
      //           child: const Text('Apply'),
      //         );
      //       } else {
      //         return const Text('Somethign went wrong!');
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
