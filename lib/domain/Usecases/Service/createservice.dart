import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';
import 'package:infinity_bank/domain/Usecases/Service/servicevalidator.dart';

class CreateServiceUseCase {
  final ServiceRepository repository;

  CreateServiceUseCase(this.repository);

  Future<String?> call(Service service) async {
    final errorMessage = ServiceValidator.validate(service);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.createService(service);
    } catch (e) {
      return 'Error al crear el servicio: $e';
    }
    return null;
  }
}
