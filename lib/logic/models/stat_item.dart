import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/stat_item.dart';

part 'stat_item.freezed.dart';

@freezed
abstract class StatItem with _$StatItem {
  const factory StatItem({
    required final int categoryId,
    required final String categoryName,
    required final String emoji,
    required final Decimal amount,
  }) = _StatItem;

  factory StatItem.fromDto(final StatItemDto dto) => StatItem(
    categoryId: dto.categoryId,
    categoryName: dto.categoryName,
    emoji: dto.emoji,
    amount: dto.amount,
  );
}
