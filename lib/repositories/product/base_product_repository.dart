import 'package:food_app/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getProducts();
  Stream<List<Product>> getProductsByRestaurant(String restaurantId);
}
