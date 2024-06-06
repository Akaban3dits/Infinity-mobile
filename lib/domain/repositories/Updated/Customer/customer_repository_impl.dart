import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  @override
  Future<Customer> loadCustomerData() async {
    final response = await rootBundle.loadString('assets/json/customer.json');
    final data = json.decode(response);
    return Customer.fromJson(data);
  }
}
