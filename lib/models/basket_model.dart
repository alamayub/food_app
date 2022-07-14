import 'package:equatable/equatable.dart';
import 'package:food_app/models/menu_item_model.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;

  const Basket({
    this.items = const <MenuItem>[],
    this.cutlery = false,
  });

  Basket copyWith({
    List<MenuItem>? items,
    bool? cutlery,
  }) {
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
    );
  }

  @override
  List<Object?> get props => [items, cutlery];

  Map itemQuantity(items) {
    var quantity = {};
    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subTotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subTotal) {
    return subTotal + 5;
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get totalString => total(subTotal).toStringAsFixed(2);
}
