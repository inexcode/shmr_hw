import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/logic/models/drift/database_singleton.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';

class DriftCategoriesRepository implements CategoriesRepository {
  DriftCategoriesRepository() : _databaseSingleton = DatabaseSingleton();

  final DatabaseSingleton _databaseSingleton;

  @override
  Future<List<Category>> fetchCategories() async {
    final categories = await _databaseSingleton.database.allCategories();
    return categories.map(Category.fromDatabase).toList();
  }

  @override
  Future<List<Category>> fetchCategoriesByType({
    required final bool isIncome,
  }) async {
    final categories = await _databaseSingleton.database.categoriesByType(
      isIncome: isIncome,
    );
    return categories.map(Category.fromDatabase).toList();
  }

  @override
  Future<void> saveCategories({
    required final List<Category> categories,
  }) async {
    await _databaseSingleton.database.saveCategories(
      categories: categories
          .map((final category) => category.toDatabase())
          .toList(),
    );
  }
}
