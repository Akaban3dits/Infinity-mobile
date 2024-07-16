import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/presentation/blocs/secure_storage_service.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final SecureStorageService _storage = SecureStorageService();

  Future<void> registerUser(Map<String, dynamic> userData) async {
    userData['id_bank'] = 3;
    try {
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/users',
        data: jsonEncode(userData),
      );
      print(response.statusCode);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Ocurrió un error: $e');
      rethrow;
    }
  }

  Future<String> loginUser(String phone, String password) async {
    try {
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/auth/login',
        data: jsonEncode({'phone': phone, 'password': password}),
      );
      final token = response.data['access_token'];
      await _storage.writeToken(token);
      return token;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Ocurrió un error: $e');
      rethrow;
    }
  }

  Future<Customer> getUserData() async {
    final token = await _storage.readToken();
    if (token == null) {
      throw Exception("Token not found");
    }
    try {
      final response = await _dio.get(
        'https://apimoviles-production.up.railway.app/users',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final data = response.data['data'];
      print(data);
      return Customer.fromJson(data);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Ocurrió un error: $e');
      rethrow;
    }
  }

  Future<void> updateUser(Map<String, dynamic> userData) async {
    final token = await _storage.readToken();
    if (token == null) {
      throw Exception("Token not found");
    }
    try {
      final response = await _dio.patch(
        'https://apimoviles-production.up.railway.app/users',
        data: jsonEncode(userData),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print(response.statusCode);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Ocurrió un error: $e');
      rethrow;
    }
  }
}
