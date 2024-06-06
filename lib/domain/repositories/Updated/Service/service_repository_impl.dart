import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/Updated/Service/serviceModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Service/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  @override
  Future<Service> loadServiceData() async {
    final response = await rootBundle.loadString('assets/json/service.json');
    final data = json.decode(response);
    return Service.fromJson(data);
  }
}
