import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';

class CustomerProvider {
  final Dio _dio = ApiClient().dio;

  Future<void> registerCustomer(Map<String, dynamic> customerData) async {
    customerData['id_bank'] = 3;
    try {
      final response = await _dio.post(
        '/users',
        data: jsonEncode(customerData),
      );
      print('Status code: ${response.statusCode}');
    } catch (e) {
      _handleError(e);
    }
  }

  Future<Customer> getCustomerData() async {
    try {
      final response = await _dio.get('/users');
      final data = response.data['data'];
      print(data);
      return Customer.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> updateCustomer(Map<String, dynamic> customerData) async {
    try {
      final response = await _dio.patch(
        '/users',
        data: jsonEncode(customerData),
      );
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
