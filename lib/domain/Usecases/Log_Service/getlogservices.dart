import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

class GetLogServicesUseCase {
  final LogServiceRepository repository;

  GetLogServicesUseCase(this.repository);

  Future<List<LogService>> call() async {
    try {
      final logServices = await repository.getLogServices();
      return logServices;
    } catch (e) {
      throw Exception("Error al obtener los servicios de registro: $e");
    }
  }
}
