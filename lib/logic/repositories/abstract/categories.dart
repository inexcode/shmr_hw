import 'package:shmr_hw/logic/models/category.dart';

abstract interface class CategoriesRepository {
  Future<List<Category>> fetchCategories();
  Future<List<Category>> fetchCategoriesByType({required final bool isIncome});
  Future<void> saveCategories({required final List<Category> categories});
}
