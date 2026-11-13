import 'category.dart';

abstract class CategoryRepository {
  Stream<List<Category>> watchAll();
}