import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required final int id,
    required final String name,
    required final String emoji,
    required final bool isIncome,
  }) = _Category;

  factory Category.fromJson(final Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
