import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository.dart';

class LoadCustomerData {
  final CustomerRepository repository;

  LoadCustomerData(this.repository);

  Future<Customer> call() async {
    final customerData = await repository.loadCustomerData();

    if (customerData.firstName.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(customerData.firstName)) {
      throw Exception("First name cannot be empty or invalid");
    }
    if (customerData.lastName.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(customerData.lastName)) {
      throw Exception("Last name cannot be empty or invalid");
    }
    if (customerData.dateOfBirth.isAfter(DateTime.now())) {
      throw Exception("Date of birth cannot be in the future");
    }
    if (customerData.email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(customerData.email)) {
      throw Exception("Email cannot be empty or invalid");
    }
    if (customerData.phoneNumber.isEmpty || !RegExp(r'^\d{3}-\d{3}-\d{4}$').hasMatch(customerData.phoneNumber)) {
      throw Exception("Phone number cannot be empty or invalid");
    }
    if (customerData.address.isEmpty) {
      throw Exception("Address cannot be empty");
    }

    return customerData;
  }
}
