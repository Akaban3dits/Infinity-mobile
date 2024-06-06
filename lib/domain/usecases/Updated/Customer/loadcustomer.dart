import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';

class LoadCustomerData {
  Future<Customer> call() async {
    return Customer(
      id: 1,
      firstName: "John",
      lastName: "Doe",
      dateOfBirth: DateTime.parse("1980-01-01"),
      email: "john.doe@example.com",
      phoneNumber: "123-456-7890",
      address: "123 Main St, Springfield, USA",
      createdAt: DateTime.now(),
    );
  }
}
