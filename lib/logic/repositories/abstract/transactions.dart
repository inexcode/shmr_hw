import 'package:shmr_hw/logic/models/transaction.dart';

abstract interface class TransactionsRepository {
  Future<Transaction> createTransaction({
    required final TransactionRequest request,
  });

  Future<TransactionResponse> getTransaction({
    required final int id,
  });

  Future<TransactionResponse> updateTransaction({
    required final int id,
    required final TransactionRequest request,
  });

  Future<void> deleteTransaction({
    required final int id,
  });

  Future<List<TransactionResponse>> fetchTransactions({
    required final int accountId,
    final DateTime? startDate,
    final DateTime? endDate,
  });
}
