import 'dart:convert';
import 'dart:io';

import 'package:shmr_hw/logic/models/rest_api_dto/account.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/category.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/transaction.dart';
import 'package:worker_manager/worker_manager.dart';

/// Worker manager singleton for handling JSON deserialization in isolates
class JsonWorkerManager {
  JsonWorkerManager._();

  static JsonWorkerManager? _instance;
  // let's just close our eyes on it ok
  // ignore: prefer_constructors_over_static_methods
  static JsonWorkerManager get instance => _instance ??= JsonWorkerManager._();

  bool _isInitialized = false;

  /// Calculate optimal number of isolates based on available CPU cores
  int get _optimalIsolateCount {
    final processors = Platform.numberOfProcessors;

    if (processors <= 1) {
      return 1;
    } else if (processors <= 4) {
      return processors;
    } else {
      return (processors - 1).clamp(1, 8);
    }
  }

  /// Initialize the worker manager with a pool of isolates
  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    await workerManager.init(isolatesCount: _optimalIsolateCount);

    _isInitialized = true;
  }

  /// Dispose the worker manager
  Future<void> dispose() async {
    if (!_isInitialized) {
      return;
    }

    await workerManager.dispose();
    _isInitialized = false;
  }

  Future<AccountDto> deserializeAccount(final String jsonString) async =>
      await workerManager.execute<AccountDto>(
        () => _deserializeAccount(jsonString),
      );

  Future<List<AccountDto>> deserializeAccountList(
    final String jsonString,
  ) async => await workerManager.execute<List<AccountDto>>(
    () => _deserializeAccountList(jsonString),
  );

  Future<AccountResponseDto> deserializeAccountResponse(
    final String jsonString,
  ) async => await workerManager.execute<AccountResponseDto>(
    () => _deserializeAccountResponse(jsonString),
  );

  Future<CategoryDto> deserializeCategory(final String jsonString) async =>
      await workerManager.execute<CategoryDto>(
        () => _deserializeCategory(jsonString),
      );

  Future<List<CategoryDto>> deserializeCategoryList(
    final String jsonString,
  ) async => await workerManager.execute<List<CategoryDto>>(
    () => _deserializeCategoryList(jsonString),
  );

  Future<TransactionDto> deserializeTransaction(
    final String jsonString,
  ) async => await workerManager.execute<TransactionDto>(
    () => _deserializeTransaction(jsonString),
  );

  Future<TransactionResponseDto> deserializeTransactionResponse(
    final String jsonString,
  ) async => await workerManager.execute<TransactionResponseDto>(
    () => _deserializeTransactionResponse(jsonString),
  );

  Future<List<TransactionResponseDto>> deserializeTransactionResponseList(
    final String jsonString,
  ) async => await workerManager.execute<List<TransactionResponseDto>>(
    () => _deserializeTransactionResponseList(jsonString),
  );
}

// Static functions that will run in isolates
AccountDto _deserializeAccount(final String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return AccountDto.fromJson(json);
}

List<AccountDto> _deserializeAccountList(final String jsonString) {
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList
      .map((final json) => AccountDto.fromJson(json as Map<String, dynamic>))
      .toList();
}

AccountResponseDto _deserializeAccountResponse(final String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return AccountResponseDto.fromJson(json);
}

CategoryDto _deserializeCategory(final String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return CategoryDto.fromJson(json);
}

List<CategoryDto> _deserializeCategoryList(final String jsonString) {
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList
      .map((final json) => CategoryDto.fromJson(json as Map<String, dynamic>))
      .toList();
}

TransactionDto _deserializeTransaction(final String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return TransactionDto.fromJson(json);
}

TransactionResponseDto _deserializeTransactionResponse(
  final String jsonString,
) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return TransactionResponseDto.fromJson(json);
}

List<TransactionResponseDto> _deserializeTransactionResponseList(
  final String jsonString,
) {
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList
      .map(
        (final json) =>
            TransactionResponseDto.fromJson(json as Map<String, dynamic>),
      )
      .toList();
}
