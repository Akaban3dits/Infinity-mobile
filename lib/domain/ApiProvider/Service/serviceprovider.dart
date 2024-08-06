import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';

class ServiceProvider {
  final Dio _dio = ApiClient().dio;

  Future<List<Service>> getServices() async {
    try {
      final response = await _dio.get('/services');
      final List<dynamic> data = response.data;
      return data.map((service) => Service.fromJson(service as Map<String, dynamic>)).toList();
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
