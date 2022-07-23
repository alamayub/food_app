import 'package:equatable/equatable.dart';
import 'package:food_app/models/restaurant_model.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurants extends RestaurantEvent {}

class UpdateRestaurants extends RestaurantEvent {
  final List<Restaurant> restaurants;

  const UpdateRestaurants({this.restaurants = const <Restaurant>[]});

  @override
  List<Object> get props => [restaurants];
}
