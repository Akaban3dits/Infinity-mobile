import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

class LogServiceProvider {
  final Dio _dio = ApiClient().dio;

  Future<LogService> createLogService(Map<String, dynamic> createLogServiceDto) async {
    try {
      final response = await _dio.post(
        '/log-services',
        data: jsonEncode(createLogServiceDto),
      );
      final data = response.data['data'];
      return LogService.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<LogService>> getLogServices() async {
    try {
      final response = await _dio.get('/log-services');
      final List<dynamic> data = response.data['data'];
      return data.map((logService) => LogService.fromJson(logService)).toList();
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<LogService> getLogService(int id) async {
    try {
      final response = await _dio.get('/log-services/$id');
      final data = response.data;
      return LogService.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
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
