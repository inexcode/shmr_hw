import 'package:shmr_hw/logic/models/transaction.dart';
import 'package:shmr_hw/logic/repositories/abstract/transactions.dart';
import 'package:shmr_hw/logic/repositories/rest_api/client.dart';

class RestApiTransactionsRepository implements TransactionsRepository {
  final _client = RestApiClient();

  @override
  Future<Transaction> createTransaction({
    required final TransactionRequest request,
  }) async {
    final transactionDto = await _client.createTransaction(request.toDto());
    return Transaction.fromDto(transactionDto);
  }

  @override
  Future<void> deleteTransaction({required final int id}) async {
    await _client.deleteTransaction(id);
  }

  @override
  Future<List<TransactionResponse>> fetchTransactions({
    required final int accountId,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    final transactions = await _client.getTransactions(
      accountId: accountId,
      startDate: startDate?.copyWith(hour: 0, minute: 0, second: 0),
      endDate: endDate?.copyWith(hour: 23, minute: 59, second: 59),
    );
    return transactions.map(TransactionResponse.fromDto).toList();
  }

  @override
  Future<TransactionResponse> getTransaction({required final int id}) async {
    final transaction = await _client.getTransactionDetails(id);
    return TransactionResponse.fromDto(transaction);
  }

  @override
  Future<TransactionResponse> updateTransaction({
    required final int id,
    required final TransactionRequest request,
  }) async {
    final transaction = await _client.updateTransaction(id, request.toDto());
    return TransactionResponse.fromDto(transaction);
  }
}
