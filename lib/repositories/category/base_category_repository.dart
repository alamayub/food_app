import 'package:food_app/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getCategories();
}
