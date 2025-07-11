import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/logic/models/fake_data/fake_categories.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';

class FakeCategoriesRepository implements CategoriesRepository {
  @override
  Future<List<Category>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeCategories;
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

  @override
  Future<void> saveCategories({required final List<Category> categories}) {
    throw UnimplementedError();
  }
}
