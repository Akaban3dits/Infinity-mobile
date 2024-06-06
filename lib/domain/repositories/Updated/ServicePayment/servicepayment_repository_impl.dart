import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/Updated/ServicePayment/servicepaymentModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/ServicePayment/servicepayment_repository.dart';

class ServicePaymentRepositoryImpl implements ServicePaymentRepository {
  @override
  Future<ServicePayment> loadServicePaymentData() async {
    final response = await rootBundle.loadString('assets/json/service_payment.json');
    final data = json.decode(response);
    return ServicePayment.fromJson(data);
  }
}
