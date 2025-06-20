import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_item.freezed.dart';
part 'stat_item.g.dart';

@freezed
abstract class StatItemDto with _$StatItemDto {
  const factory StatItemDto({
    required final int categoryId,
    required final String categoryName,
    required final String emoji,
    required final Decimal amount,
  }) = _StatItemDto;

  factory StatItemDto.fromJson(final Map<String, dynamic> json) =>
      _$StatItemDtoFromJson(json);
}
