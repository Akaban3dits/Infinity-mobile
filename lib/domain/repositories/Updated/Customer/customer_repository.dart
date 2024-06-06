import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';

abstract class CustomerRepository {
  Future<Customer> loadCustomerData();
}
