import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';
import 'package:infinity_bank/domain/Usecases/Service/servicevalidator.dart';

class UpdateServiceUseCase {
  final ServiceRepository repository;

  UpdateServiceUseCase(this.repository);

  Future<String?> call(int id, Service service) async {
    final errorMessage = ServiceValidator.validate(service);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.updateService(id, service);
    } catch (e) {
      return 'Error al actualizar el servicio: $e';
    }
    return null;
  }
}
