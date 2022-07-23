import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getProducts() {
    return _firebaseFirestore.collection('products').snapshots().map((docs) {
      return docs.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
  
  @override
  Stream<List<Product>> getProductsByRestaurant(String restaurantId) {
    return _firebaseFirestore.collection('products').where('restaurantId', isEqualTo: restaurantId).snapshots().map((docs) {
      return docs.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
