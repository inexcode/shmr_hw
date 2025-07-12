import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';
import 'package:shmr_hw/logic/repositories/rest_api/client.dart';

class RestApiAccountsRepository implements AccountsRepository {
  final RestApiClient _client = RestApiClient();

  @override
  Future<Account> createAccount({required final AccountRequest request}) async {
    final account = await _client.createAccount(request.toDto());
    return Account.fromDto(account);
  }

  @override
  Future<List<Account>> fetchAccounts() async {
    final accounts = await _client.getAccounts();
    return accounts.map(Account.fromDto).toList();
  }

  @override
  Future<AccountDetails> getAccount({required final int id}) async {
    final accountDetails = await _client.getAccountDetails(id);
    return AccountDetails.fromDto(accountDetails);
  }

  @override
  Future<Account> updateAccount({
    required final int id,
    required final AccountRequest request,
  }) async {
    final account = await _client.updateAccount(id, request.toDto());
    return Account.fromDto(account);
  }
}
