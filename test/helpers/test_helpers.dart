import 'package:decimal/decimal.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/account.dart';

class TestHelpers {
  /// Creates a test Account instance with provided parameters
  static Account createTestAccount({
    required final int id,
    required final String name,
    required final double balance,
    required final Currency currency,
    final int? userId,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) => Account(
    id: id,
    userId: userId ?? 1,
    name: name,
    balance: Decimal.parse(balance.toString()),
    currency: currency.name,
    createdAt: createdAt ?? DateTime.now(),
    updatedAt: updatedAt ?? DateTime.now(),
  );

  /// Creates a test AccountDto instance for remote API responses
  static AccountDto createTestAccountDto({
    required final int id,
    required final String name,
    required final double balance,
    required final String currency,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) => AccountDto(
    id: id,
    name: name,
    balance: Decimal.parse(balance.toString()),
    currency: currency,
    createdAt: createdAt ?? DateTime.now(),
    updatedAt: updatedAt ?? DateTime.now(),
    userId: id,
  );

  /// Creates a test AccountRequest instance
  static AccountRequest createTestAccountRequest({
    required final String name,
    required final String currency,
    required final Decimal balance,
  }) => AccountRequest(name: name, currency: currency, balance: balance);

  /// Creates a list of test accounts for bulk testing
  static List<Account> createTestAccountList({final int count = 3}) =>
      List.generate(count, (final index) {
        final currencies = [Currency.usd, Currency.eur, Currency.rub];
        return createTestAccount(
          id: index + 1,
          name: 'Test Account ${index + 1}',
          balance: (index + 1) * 1000.0,
          currency: currencies[index % currencies.length],
        );
      });

  /// Creates a list of test account DTOs for bulk testing
  static List<AccountDto> createTestAccountDtoList({final int count = 3}) =>
      List.generate(count, (final index) {
        final currencies = ['USD', 'EUR', 'RUB'];
        return createTestAccountDto(
          id: index + 1,
          name: 'Test Account DTO ${index + 1}',
          balance: (index + 1) * 1000.0,
          currency: currencies[index % currencies.length],
        );
      });
}
