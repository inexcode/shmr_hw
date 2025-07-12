import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/ui/components/custom_icons.dart';

enum AccountHistoryChangeType {
  @JsonValue('CREATION')
  creation,
  @JsonValue('MODIFICATION')
  modification,
}

enum TransactionEventType { creation, modification, deletion }

class UnknownCurrencyException implements Exception {
  UnknownCurrencyException(this.message);
  final String message;

  @override
  String toString() => 'UnknownCurrencyException: $message';
}

enum Currency {
  rub,
  usd,
  eur;

  factory Currency.fromString(final String value) {
    switch (value.toUpperCase()) {
      case '₽':
      case 'RUB':
        return Currency.rub;
      case r'$':
      case 'USD':
        return Currency.usd;
      case '€':
      case 'EUR':
        return Currency.eur;
      default:
        throw UnknownCurrencyException('Unknown currency: $value');
    }
  }

  String get symbol {
    switch (this) {
      case Currency.rub:
        return '₽';
      case Currency.usd:
        return r'$';
      case Currency.eur:
        return '€';
    }
  }

  String get name {
    switch (this) {
      case Currency.rub:
        return 'RUB';
      case Currency.usd:
        return 'USD';
      case Currency.eur:
        return 'EUR';
    }
  }

  String get fullName {
    switch (this) {
      case Currency.rub:
        return 'currencies.russian_ruble';
      case Currency.usd:
        return 'currencies.american_dollar';
      case Currency.eur:
        return 'currencies.euro';
    }
  }

  IconData get icon {
    switch (this) {
      case Currency.rub:
        return CustomIcons.rubleSign;
      case Currency.usd:
        return CustomIcons.dollarSign;
      case Currency.eur:
        return CustomIcons.euroSign;
    }
  }
}
