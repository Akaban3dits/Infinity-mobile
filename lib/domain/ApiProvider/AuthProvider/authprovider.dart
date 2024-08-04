import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/presentation/blocs/secure_storage_service.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';

class AuthProvider {
  final Dio _dio = ApiClient().dio;
  final SecureStorageService _storage = SecureStorageService();

  Future<String> login(String phone, String password) async {
    try {
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/auth/login',
        data: jsonEncode({'phone': phone, 'password': password}),
      );
      final token = response.data['access_token'];
      await _storage.writeToken(token);
      return token;
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Ocurrió un error: $e');
      rethrow;
    }
  }
  
  Future<void> logout() async {
    await _storage.deleteToken();
  }
}
