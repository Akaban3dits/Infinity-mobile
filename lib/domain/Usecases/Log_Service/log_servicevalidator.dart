import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

class LogServiceValidator {
  static String? validate(LogService logService) {
    if (logService.reference.isEmpty ||
        logService.reference.length != 12 ||
        !RegExp(r'^\d{12}$').hasMatch(logService.reference)) {
      return 'Referencia inválida. Debe tener exactamente 12 dígitos.';
    }


    return null;
  }
}
