import 'package:equatable/equatable.dart';
import 'package:food_app/models/restaurant_model.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<Restaurant> restaurants;

  const RestaurantLoaded({this.restaurants = const <Restaurant>[]});

  @override
  List<Object> get props => [restaurants];
}
