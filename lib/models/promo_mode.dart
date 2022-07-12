import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String image;

  const Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title, description, image];

  static List<Promo> promos = const [
    Promo(
      id: 1,
      title: 'FREE Delivery on Your First 3 Orders.',
      description: 'Place and Order of \$10 or more and delivery fee is on us.',
      image:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-menu-promotion-banner-2x6-design-template-829dd4c0a9901048bf81549ea076baa7_screen.jpg?ts=1633750162',
    ),
    Promo(
      id: 1,
      title: '20% off on Selected Restaurant.',
      description: 'Get a discount at more than 200+ restaurant.',
      image:
          'https://png.pngtree.com/png-clipart/20210704/original/pngtree-orange-striped-fast-food-coupon-banner-png-image_6485849.jpg',
    ),
  ];
}
