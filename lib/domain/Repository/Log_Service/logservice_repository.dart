import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

abstract class LogServiceRepository {
  Future<LogService> createLogService(LogService logService);
  Future<List<LogService>> getLogServices();
}
