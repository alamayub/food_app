import 'package:food_app/models/restaurant_model.dart';

abstract class BaseRestaurantRepository {
  Stream<List<Restaurant>> getRestaurants();
}
