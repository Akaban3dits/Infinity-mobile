import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:dio/dio.dart' as dio;

class ServiceProvider {
  final Dio _dio = ApiClient().dio;

  Future<Service> createService(Map<String, dynamic> createServiceDto) async {
    try {
      final response = await _dio.post(
        '/services',
        data: jsonEncode(createServiceDto),
      );
      final data = response.data['data'];
      return Service.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<Service>> getServices() async {
    try {
      final response = await _dio.get('/services');
      final List<dynamic> data = response.data['data'];
      return data.map((service) => Service.fromJson(service)).toList();
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Service> getService(int id) async {
    try {
      final response = await _dio.get('/services/$id');
      final data = response.data;
      return Service.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> updateService(int id, Map<String, dynamic> updateServiceDto) async {
    try {
      final response = await _dio.patch(
        '/services/$id',
        data: jsonEncode(updateServiceDto),
      );
      print('Status code: ${response.statusCode}');
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> deleteService(int id) async {
    try {
      final response = await _dio.delete('/services/$id');
      print('Status code: ${response.statusCode}');
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> uploadServiceIcon(int id, String filePath) async {
    try {
      String fileName = filePath.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await dio.MultipartFile.fromFile(filePath, filename: fileName),
      });

      final response = await _dio.post(
        '/services/$id/upload',
        data: formData,
      );
      print('Status code: ${response.statusCode}');
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
