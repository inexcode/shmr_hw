import 'package:shmr_hw/logic/models/account.dart';

abstract interface class AccountsRepository {
  Future<List<Account>> fetchAccounts();

  Future<Account> createAccount({
    required final AccountRequest request,
  });

  Future<AccountDetails> getAccount({
    required final int id,
  });

  Future<Account> updateAccount({
    required final int id,
    required final AccountRequest request,
  });

  Future<AccountHistoryResponse> getAccountHistory({
    required final int id,
  });
}
