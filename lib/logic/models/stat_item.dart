import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_item.freezed.dart';
part 'stat_item.g.dart';

@freezed
abstract class StatItem with _$StatItem {
  const factory StatItem({
    required final int categoryId,
    required final String categoryName,
    required final String emoji,
    required final Decimal amount,
  }) = _StatItem;

  factory StatItem.fromJson(final Map<String, dynamic> json) =>
      _$StatItemFromJson(json);
}