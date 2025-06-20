import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required final int id,
    required final String name,
    required final String emoji,
    required final bool isIncome,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(final Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
