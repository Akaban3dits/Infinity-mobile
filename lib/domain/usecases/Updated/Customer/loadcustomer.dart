import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository.dart';

class LoadCustomerData {
  final CustomerRepository respository;
  LoadCustomerData(this.respository);

  Future<Customer> call() async {
    return await respository.loadCustomerData();
}}
