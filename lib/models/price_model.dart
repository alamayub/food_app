import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  const Price({
    required this.id,
    required this.price,
  });

  @override
  List<Object?> get props => [id, price];

  static List<Price> prices = const [
    Price(id: 1, price: '\$'),
    Price(id: 2, price: '\$\$'),
    Price(id: 3, price: '\$\$\$')
  ];
}
