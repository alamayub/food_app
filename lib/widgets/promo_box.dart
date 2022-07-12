import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(6),
          image: const DecorationImage(
            image: NetworkImage(
                'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/128289834/original/39b3cd433ae96fea7fbb1795940ffa4665d6606f/create-restaurant-promo-or-food-promotion-video.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.only(top: 10, left: 15, right: 125),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FREE Delivery on Your First 3 Orders.',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Place and Order of \$10 or more and delivery fee is on us.',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    ]);
  }
}
