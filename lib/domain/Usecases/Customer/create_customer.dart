import 'package:infinity_bank/domain/Repository/Customer/customer_repository.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/domain/Usecases/Customer/customer_validator.dart';

class CreateCustomerUseCase {
  final CustomerRepository repository;

  CreateCustomerUseCase(this.repository);

  Future<String?> call(Customer customer) async {
    final errorMessage = CustomerValidator.validate(customer);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.createCustomer(customer);
    } catch (e) {
      return 'Error al crear el cliente: $e';
    }
    return null;
  }
}
