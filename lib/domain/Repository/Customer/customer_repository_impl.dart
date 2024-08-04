import 'package:infinity_bank/domain/ApiProvider/Customer/customerProvider.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/domain/Repository/Customer/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerProvider _provider;

  CustomerRepositoryImpl(this._provider);

  @override
  Future<Customer> getCustomer() async {
    try {
      final customer = await _provider.getCustomerData();
      return customer;
    } catch (e) {
      throw Exception("Failed to get customer: $e");
    }
  }

  @override
  Future<Customer> createCustomer(Customer customer) async {
    try {
      await _provider.registerCustomer(customer.toJson());
      return customer;
    } catch (e) {
      throw Exception("Failed to create customer: $e");
    }
  }

  @override
  Future<bool> updateCustomer(Customer customer) async {
    try {
      await _provider.updateCustomer(customer.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
