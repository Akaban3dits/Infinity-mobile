import 'dart:convert'; // Importar la librería para convertir a JSON
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<void> registerUser(Map<String, dynamic> userData) async {
    userData['id_bank'] = 3; // Agregar el ID del banco al userData
    print(jsonEncode(userData)); // Convertir a JSON y mostrarlo

    try {
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/users',
        data: jsonEncode(userData), // Convertir a JSON
        
      );

      print(response.statusCode);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow; // Rethrow para que la excepción pueda ser manejada externamente si es necesario
    } catch (e) {
      print('Ocurrió un error: $e');
      rethrow; // Rethrow para que la excepción pueda ser manejada externamente si es necesario
    }
  }
}
