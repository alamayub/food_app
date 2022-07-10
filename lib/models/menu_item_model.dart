import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final double price;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, restaurantId, name, description, price];

  static List<MenuItem> menuItems = const [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Pizza',
      description: 'Veg pizza with extra cheese',
      price: 399,
    ),
    MenuItem(
      id: 2,
      restaurantId: 2,
      name: 'Veg Biryani',
      description:
          'It\'s besically pulao, but they call it biryani for thier own satisfaction.',
      price: 100,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Dosa',
      description: 'Masala Dosa',
      price: 250,
    ),
  ];
}
