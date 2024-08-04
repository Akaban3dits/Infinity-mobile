import 'package:infinity_bank/domain/ApiProvider/Log_Service/logserviceprovider.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository.dart';

class LogServiceRepositoryImpl implements LogServiceRepository {
  final LogServiceProvider _provider;

  LogServiceRepositoryImpl(this._provider);

  @override
  Future<LogService> createLogService(LogService logService) async {
    try {
      final createdLogService =
          await _provider.createLogService(logService.toJson());
      return createdLogService;
    } catch (e) {
      throw Exception("Failed to create log service: $e");
    }
  }

  @override
  Future<List<LogService>> getLogServices() async {
    try {
      final logServices = await _provider.getLogServices();
      return logServices;
    } catch (e) {
      throw Exception("Failed to get log services: $e");
    }
  }

  @override
  Future<LogService> getLogService(int id) async {
    try {
      final logService = await _provider.getLogService(id);
      return logService;
    } catch (e) {
      throw Exception("Failed to get log service: $e");
    }
  }
}
