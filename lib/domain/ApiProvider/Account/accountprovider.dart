import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';
import 'package:infinity_bank/domain/Model/Account/accountModel.dart';

class AccountProvider {
  final Dio _dio = ApiClient().dio;

  Future<Account> getAccountData() async {
    try {
      final response = await _dio.get('/accounts/me');
      final data = response.data['data'];
      print('Data recibida: $data');

      print(data);
      return Account.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> updateAccount(int id, Map<String, dynamic> updateData) async {
    try {
      final response = await _dio.patch(
        '/accounts/$id',
        data: jsonEncode(updateData),
      );
      print('Status code: ${response.statusCode}');
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> deleteAccount(int id) async {
    try {
      final response = await _dio.delete('/accounts/$id');
      print('Status code: ${response.statusCode}');
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleError(dynamic error) {
    if (error is DioException) {
      print('DioError: ${error.message}');
      print('Response status code: ${error.response?.statusCode}');
      print('Response data: ${error.response?.data}');
    } else {
      print('Ocurrió un error: $error');
    }
  }
}
