import 'package:equatable/equatable.dart';
import 'package:food_app/models/product_model.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class ProductsByRestaurant extends ProductEvent {
  final String restaurantId;
  const ProductsByRestaurant({required this.restaurantId});

  @override
  List<Object> get props => [restaurantId];
}

class UpdateProducts extends ProductEvent {
  final List<Product> products;

  const UpdateProducts({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}
