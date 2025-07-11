import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/drift/database.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/category.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required final int id,
    required final String name,
    required final String emoji,
    required final bool isIncome,
  }) = _Category;

  const Category._();

  factory Category.fromDto(final CategoryDto dto) => Category(
    id: dto.id,
    name: dto.name,
    emoji: dto.emoji,
    isIncome: dto.isIncome,
  );

  factory Category.fromDatabase(final DatabaseCategory dbCategory) => Category(
    id: dbCategory.id,
    name: dbCategory.name,
    emoji: dbCategory.emoji,
    isIncome: dbCategory.isIncome,
  );

  DatabaseCategory toDatabase() =>
      DatabaseCategory(id: id, name: name, emoji: emoji, isIncome: isIncome);
}
