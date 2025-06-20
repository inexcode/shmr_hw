import 'package:freezed_annotation/freezed_annotation.dart';

enum AccountHistoryChangeType {
  @JsonValue('CREATION')
  creation,
  @JsonValue('MODIFICATION')
  modification,
}
