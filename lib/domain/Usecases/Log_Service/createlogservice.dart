import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';
import 'package:infinity_bank/domain/Usecases/Log_Service/log_servicevalidator.dart';

class CreateLogServiceUseCase {
  final LogServiceRepository repository;

  CreateLogServiceUseCase(this.repository);

  Future<String?> call(LogService logService) async {
    final errorMessage = LogServiceValidator.validate(logService);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.createLogService(logService);
    } catch (e) {
      return 'Error al crear el servicio de registro: $e';
    }
    return null;
  }
}
