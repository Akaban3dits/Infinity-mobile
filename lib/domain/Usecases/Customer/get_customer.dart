import 'package:infinity_bank/domain/Repository/Customer/customer_repository.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/domain/Usecases/Customer/customer_validator.dart';

class GetCustomerUseCase {
  final CustomerRepository repository;

  GetCustomerUseCase(this.repository);

  Future<Customer> call() async {
    final customer = await repository.getCustomer();

    if (!isValidCustomer(customer)) {
      throw Exception("Invalid customer data");
    }

    return customer;
  }

  bool isValidCustomer(Customer customer) {
    return CustomerValidator.validate(customer) == null;
  }
}
