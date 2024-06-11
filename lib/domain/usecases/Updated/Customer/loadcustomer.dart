import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';

class LoadCustomerData {
  Future<Customer> call() async {
    return Customer(
      id: 1,
      firstName: "John",
      lastName: "Doe",
      email: "john.doe@example.com",
      phoneNumber: "123-456-7890",
      rfc: "1238080213ja",
      password: "securePass456",
      idbank: 1
    );
  }
}
