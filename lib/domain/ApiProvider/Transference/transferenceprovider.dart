import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

class TransferenceProvider {
  final Dio _dio = ApiClient().dio;

  Future<Transference> createTransference(Map<String, dynamic> createTransferenceDto) async {
    try {
      final response = await _dio.post(
        '/transferences',
        data: jsonEncode(createTransferenceDto),
      );
      final data = response.data['data'];
      return Transference.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<Transference>> getTransferences() async {
    try {
      final response = await _dio.get('/transferences');
      final List<dynamic> data = response.data['data'];
      return data.map((transference) => Transference.fromJson(transference)).toList();
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Transference> getTransference(int id) async {
    try {
      final response = await _dio.get('/transferences/$id');
      final data = response.data;
      return Transference.fromJson(data);
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
