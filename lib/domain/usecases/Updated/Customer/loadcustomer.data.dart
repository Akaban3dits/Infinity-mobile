import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository.dart';

class LoadCustomerData {
  final CustomerRepository repository;

  LoadCustomerData(this.repository);

  Future<Customer> call() async {
    final customerData = await repository.loadCustomerData();

    if (customerData.firstName.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(customerData.firstName)) {
      throw Exception("First name cannot be empty or invalid");
    }
    if (customerData.lastName.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(customerData.lastName)) {
      throw Exception("Last name cannot be empty or invalid");
    }
    if (customerData.email.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(customerData.email)) {
      throw Exception("Email cannot be empty or invalid");
    }
    if (customerData.phoneNumber.isEmpty ||
        !RegExp(r'^\d{3}-\d{3}-\d{4}$').hasMatch(customerData.phoneNumber)) {
      throw Exception("Phone number cannot be empty or invalid");
    }
    if (customerData.rfc.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(customerData.rfc)) {
      throw Exception(
          "RFC cannot be empty and must contain only letters and numbers");
    }
    if (customerData.password.isEmpty ||
        !RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]{8,12}$')
            .hasMatch(customerData.password)) {
      throw Exception(
          "Password cannot be empty and must be between 8 and 12 characters including special characters");
    }
  
    return customerData;
  }
}
