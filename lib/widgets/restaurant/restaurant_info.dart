import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/basket/basket_state.dart';
import 'package:food_app/blocs/product/product_bloc.dart';
import 'package:food_app/blocs/product/product_state.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/widgets/restaurant/restaurant_tags.dart';

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInfo({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(height: 5),
          Text(
            '3km - \$5 delivery fee',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          Text(
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    var item = state.products[index];
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ListTile(
                        title: Text(item.name),
                        trailing: BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            if (state is BasketLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is BasketLoaded) {
                              return IconButton(
                                  onPressed: () {
                                    context
                                        .read<BasketBloc>()
                                        .add(AddItem(item: item));
                                  },
                                  icon: const Icon(Icons.add_outlined));
                            } else {
                              return const Center(
                                  child: Text('Somthing went wrong!'));
                            }
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
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

class $ {}

Widget _buildMenuItems(
  Restaurant restaurant,
  BuildContext context,
  int index,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        restaurant.categories[index],
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      // const SizedBox(height: 6),
      // Column(
      //   children: restaurant.menuItems
      //       .where((menuItem) =>
      //           restaurant.tags[index].contains(menuItem.category))
      //       .map((menuItem) => Column(
      //             children: [
      //               ListTile(
      //                 dense: true,
      //                 contentPadding: EdgeInsets.zero,
      //                 title: Text(menuItem.name),
      //                 subtitle: Text(menuItem.description),
      //                 trailing: Row(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Text('\$${menuItem.price}'),
      //                     BlocBuilder<BasketBloc, BasketState>(
      //                       builder: (context, state) {
      //                         if (state is BasketLoading) {
      //                           return const Center(
      //                             child: CircularProgressIndicator(),
      //                           );
      //                         } else if (state is BasketLoaded) {
      //                           return IconButton(
      //                             onPressed: () {
      // context
      //     .read<BasketBloc>()
      //     .add(AddItem(item: menuItem));
      //                             },
      //                             icon: const Icon(Icons.add_circle),
      //                           );
      //                         } else {
      //                           return const Text('Something went wrong!');
      //                         }
      //                       },
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ))
      //       .toList(),
      // )
    ],
  );
}
