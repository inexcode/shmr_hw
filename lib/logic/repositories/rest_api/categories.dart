import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';
import 'package:shmr_hw/logic/repositories/rest_api/client.dart';

class RestApiCategoriesRepository implements CategoriesRepository {
  final RestApiClient _client = RestApiClient();

  @override
  Future<List<Category>> fetchCategories() async {
    final categories = await _client.getCategories();
    return categories.map(Category.fromDto).toList();
  }

  @override
  Future<List<Category>> fetchCategoriesByType({
    required final bool isIncome,
  }) async {
    final categories = await _client.getCategoriesByType(isIncome: isIncome);
    return categories.map(Category.fromDto).toList();
  }
}
