import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getCategories() {
    return _firebaseFirestore.collection('categories').snapshots().map((docs) {
      return docs.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
