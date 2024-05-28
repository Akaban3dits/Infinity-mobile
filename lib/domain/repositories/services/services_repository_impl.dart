import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/services/servicesModel.dart';
import 'package:infinity_bank/domain/repositories/services/services_repository.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  @override
  Future<ServicesModel> loadServicesData() async {
    final response = await rootBundle.loadString(('assets/json/services.json'));
    final data = json.decode(response);
    return ServicesModel.fromJson(data);
  }
}
