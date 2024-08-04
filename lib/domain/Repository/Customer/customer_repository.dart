import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';

abstract class CustomerRepository {
  Future<Customer> getCustomer();
  Future<Customer> createCustomer(Customer customer);
  Future<bool> updateCustomer(Customer customer);
}
