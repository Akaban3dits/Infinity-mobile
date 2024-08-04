import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

class GetLogServiceUseCase {
  final LogServiceRepository repository;

  GetLogServiceUseCase(this.repository);

  Future<LogService> call(int id) async {
    try {
      return await repository.getLogService(id);
    } catch (e) {
      throw Exception("Error al obtener el servicio de registro: $e");
    }
  }
}
