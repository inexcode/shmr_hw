import 'package:shmr_hw/logic/models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> fetchCategories();
  Future<List<Category>> fetchCategoriesByType({required final bool isIncome});
}
