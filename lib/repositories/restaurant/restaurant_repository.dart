// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:food_app/repositories/restaurant/base_restaurant_repository.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Restaurant>> getRestaurants() {
    return _firebaseFirestore.collection('restaurants').snapshots().map((docs) {
      return docs.docs.map((doc) => Restaurant.fromSnapshot(doc)).toList();
    });
  }
}
