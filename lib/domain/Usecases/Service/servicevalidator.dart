import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';

class ServiceValidator {
  static String? validate(Service service) {
    if (service.name.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(service.name)) {
      return 'Nombre del servicio inválido. Solo se permiten letras, números y espacios.';
    }
    if (service.icono.isEmpty ||
        !RegExp(r'^(http|https):\/\/').hasMatch(service.icono)) {
      return 'URL del icono inválido. Debe ser una URL válida.';
    }
    return null;
  }
}
