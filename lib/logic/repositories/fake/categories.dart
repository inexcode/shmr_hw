import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';

class FakeCategoriesRepository implements CategoriesRepository {
  @override
  Future<List<Category>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Category(
        id: 1,
        name: 'Еда',
        emoji: '🍔',
        isIncome: false,
      ),
      const Category(
        id: 2,
        name: 'Зарплата',
        emoji: '💰',
        isIncome: true,
      ),
    ];
  }

  @override
  Future<List<Category>> fetchCategoriesByType({
    required final bool isIncome,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return fetchCategories().then(
      (final categories) => categories
          .where((final category) => category.isIncome == isIncome)
          .toList(),
    );
  }
}
