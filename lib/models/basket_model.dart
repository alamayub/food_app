import 'package:equatable/equatable.dart';
import 'package:food_app/models/delivery_time_model.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/models/voucher_model.dart';

class Basket extends Equatable {
  final List<Product> items;
  final Voucher? voucher;
  final DeliveryTime? deliveryTime;

  const Basket({
    this.items = const <Product>[],
    this.voucher,
    this.deliveryTime,
  });

  Basket copyWith({
    List<Product>? items,
    Voucher? voucher,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
      items: items ?? this.items,
      voucher: voucher ?? this.voucher,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [items, voucher, deliveryTime];

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
    return (voucher == null) ? subTotal + 5 : subTotal + 5 - voucher!.value;
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get totalString => total(subTotal).toStringAsFixed(2);
}
