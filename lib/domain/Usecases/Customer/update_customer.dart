import 'package:infinity_bank/domain/Repository/Customer/customer_repository.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/domain/Usecases/Customer/customer_validator.dart';

class UpdateCustomerUseCase {
  final CustomerRepository repository;

  UpdateCustomerUseCase(this.repository);

  Future<String?> call(Customer customer) async {
    final errorMessage = CustomerValidator.validate(customer);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.updateCustomer(customer);
    } catch (e) {
      return 'Error al actualizar el cliente: $e';
    }
    return null;
  }
}
