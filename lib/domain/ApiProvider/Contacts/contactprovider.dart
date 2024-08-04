import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infinity_bank/domain/ApiProvider/ApiClient.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';

class ContactProvider {
  final Dio _dio = ApiClient().dio;

  Future<Contact> createContact(Map<String, dynamic> createContactDto) async {
    try {
      final response = await _dio.post(
        '/contacts',
        data: jsonEncode(createContactDto),
      );
      final data = response.data['data'];
      return Contact.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<Contact>> getContacts() async {
    try {
      final response = await _dio.get('/contacts');
      final List<dynamic> data = response.data['data'];
      return data.map((contact) => Contact.fromJson(contact)).toList();
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Contact> getContact(int id) async {
    try {
      final response = await _dio.get('/contacts/$id');
      final data = response.data;
      return Contact.fromJson(data);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> updateContact(int id, Map<String, dynamic> updateContactDto) async {
    try {
      final response = await _dio.patch(
        '/contacts/$id',
        data: jsonEncode(updateContactDto),
      );
      print('Status code: ${response.statusCode}');
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> deleteContact(int id) async {
    try {
      final response = await _dio.delete('/contacts/$id');
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
