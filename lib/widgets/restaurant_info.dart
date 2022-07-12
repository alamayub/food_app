import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/widgets/restaurant_tags.dart';

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
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(height: 5),
          Text(
            '${restaurant.distance}km - \$${restaurant.deliveryFee} delivery fee',
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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: restaurant.tags.length,
            itemBuilder: (context, index) =>
                _buildMenuItems(restaurant, context, index),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          )
        ],
      ),
    );
  }
}

Widget _buildMenuItems(
  Restaurant restaurant,
  BuildContext context,
  int index,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        restaurant.tags[index],
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      const SizedBox(height: 6),
      Column(
        children: restaurant.menuItems
            .where((menuItem) =>
                restaurant.tags[index].contains(menuItem.category))
            .map((menuItem) => Column(
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(menuItem.name),
                      subtitle: Text(menuItem.description),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${menuItem.price}'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_circle),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
            .toList(),
      )
      // Column(
      //   children: restaurant.menuItems
      //       .where((menuItem) => menuItem.category == restaurant.tags[index])
      //       .map(
      //         (x) => Column(
      //           children: [
      //             ListTile(
      //               title: Text(x.name),
      //               subtitle: Text(x.description),
      //               trailing: Row(
      //                 children: [
      //                   Text('\$${x.price}'),
      //                   IconButton(
      //                     onPressed: () {},
      //                     icon: const Icon(
      //                       Icons.add_circle,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       )
      //       .toList(),
      // )
    ],
  );
}
