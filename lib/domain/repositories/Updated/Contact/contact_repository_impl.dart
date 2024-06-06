import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/Updated/Contact/contactModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Contact/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  @override
  Future<Contact> loadContactData() async {
    final response = await rootBundle.loadString('assets/json/contact.json');
    final data = json.decode(response);
    return Contact.fromJson(data);
  }
}
