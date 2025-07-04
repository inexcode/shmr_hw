import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shmr_hw/logic/models/rest_api_dto/account.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/category.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/transaction.dart';
import 'package:shmr_hw/logic/repositories/rest_api/exceptions.dart';

class RestApiClient {
  RestApiClient({this.baseUrl = 'https://shmr-finance.ru/api/v1'})
    : _bearerToken = dotenv.env['REST_API_TOKEN'] ?? '';

  final String baseUrl;
  final String _bearerToken;

  Future<http.Response> get(
    final String endpoint, {
    final Map<String, String>? queryParameters,
  }) {
    final uri = Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: queryParameters);
    return http.get(uri, headers: _headers());
  }

  Future<http.Response> post(
    final String endpoint, {
    final Map<String, dynamic>? body,
  }) {
    final uri = Uri.parse('$baseUrl$endpoint');
    return http.post(uri, headers: _headers(), body: jsonEncode(body));
  }

  Future<http.Response> put(
    final String endpoint, {
    final Map<String, dynamic>? body,
  }) {
    final uri = Uri.parse('$baseUrl$endpoint');
    return http.put(uri, headers: _headers(), body: jsonEncode(body));
  }

  Future<http.Response> delete(final String endpoint) {
    final uri = Uri.parse('$baseUrl$endpoint');
    return http.delete(uri, headers: _headers());
  }

  Future<List<AccountDto>> getAccounts() async {
    final response = await get('/accounts');

    _checkCommonErrors(response);

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map((final json) => AccountDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<AccountDto> createAccount(final AccountRequestDto request) async {
    final response = await post('/accounts', body: request.toJson());

    _checkCommonErrors(response);

    return AccountDto.fromJson(jsonDecode(response.body));
  }

  Future<AccountResponseDto> getAccountDetails(final int id) async {
    final response = await get('/accounts/$id');

    _checkCommonErrors(response);

    return AccountResponseDto.fromJson(jsonDecode(response.body));
  }

  Future<AccountDto> updateAccount(
    final int id,
    final AccountRequestDto request,
  ) async {
    final response = await put('/accounts/$id', body: request.toJson());

    _checkCommonErrors(response);

    return AccountDto.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteAccount(final int id) async {
    final response = await delete('/accounts/$id');

    _checkCommonErrors(response);
  }

  Future<AccountHistoryDtoResponse> getAccountHistory(final int id) async {
    final response = await get('/accounts/$id/history');

    _checkCommonErrors(response);

    return AccountHistoryDtoResponse.fromJson(jsonDecode(response.body));
  }

  Future<List<CategoryDto>> getCategories() async {
    final response = await get('/categories');

    _checkCommonErrors(response);

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map((final json) => CategoryDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<CategoryDto>> getCategoriesByType({
    required final bool isIncome,
  }) async {
    final response = await get(
      '/categories',
      queryParameters: {'is_income': isIncome.toString()},
    );

    _checkCommonErrors(response);

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map((final json) => CategoryDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<TransactionDto> createTransaction(
    final TransactionRequestDto request,
  ) async {
    final response = await post('/transactions', body: request.toJson());

    _checkCommonErrors(response);

    return TransactionDto.fromJson(jsonDecode(response.body));
  }

  Future<TransactionResponseDto> getTransactionDetails(final int id) async {
    final response = await get('/transactions/$id');

    _checkCommonErrors(response);

    return TransactionResponseDto.fromJson(jsonDecode(response.body));
  }

  Future<TransactionResponseDto> updateTransaction(
    final int id,
    final TransactionRequestDto request,
  ) async {
    final response = await put('/transactions/$id', body: request.toJson());

    _checkCommonErrors(response);

    return TransactionResponseDto.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteTransaction(final int id) async {
    final response = await delete('/transactions/$id');

    _checkCommonErrors(response);
  }

  Future<List<TransactionResponseDto>> getTransactions({
    required final int accountId,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    final queryParameters = <String, String>{
      if (startDate != null)
        'start_date': DateFormat('yyyy-MM-dd').format(startDate),
      if (endDate != null) 'end_date': DateFormat('yyyy-MM-dd').format(endDate),
    };

    final response = await get(
      '/transactions/account/$accountId/period',
      queryParameters: queryParameters,
    );

    _checkCommonErrors(response);

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map(
          (final json) =>
              TransactionResponseDto.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  Map<String, String> _headers() => {
    'Content-Type': 'application/json',
    if (_bearerToken.isNotEmpty) 'Authorization': 'Bearer $_bearerToken',
  };

  void _checkCommonErrors(final http.Response response) {
    if (response.statusCode == HttpStatus.unauthorized) {
      throw UnauthorizedException();
    }
    if (response.statusCode == HttpStatus.badRequest) {
      throw BadRequestException(message: response.body);
    }
    if (response.statusCode == HttpStatus.notFound) {
      throw NotFoundException(message: response.body);
    }
    if (response.statusCode == HttpStatus.conflict) {
      throw ConflictException(message: response.body);
    }
    if (response.statusCode == HttpStatus.internalServerError) {
      throw InternalServerErrorException(message: response.body);
    }
    if (response.statusCode < HttpStatus.ok ||
        response.statusCode >= HttpStatus.multipleChoices) {
      throw Exception('HTTP error: ${response.statusCode} - ${response.body}');
    }
  }
}
