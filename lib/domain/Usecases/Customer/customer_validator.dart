import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';

class CustomerValidator {
  static String? validate(Customer customer) {
    // Validar nombre
    if (customer.firstName.isEmpty ||
        !RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,}$').hasMatch(customer.firstName)) {
      return 'Nombre inválido. Solo se permiten letras, espacios y debe tener al menos 2 caracteres.';
    }

    // Validar apellido
    if (customer.lastName.isEmpty ||
        !RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,}$').hasMatch(customer.lastName)) {
      return 'Apellido inválido. Solo se permiten letras, espacios y debe tener al menos 2 caracteres.';
    }

    // Validar correo electrónico
    if (customer.email.isEmpty ||
        !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(customer.email)) {
      return 'Correo electrónico inválido.';
    }

    // Validar número de teléfono
    if (customer.phoneNumber.isEmpty ||
        !RegExp(r'^\d{10}$').hasMatch(customer.phoneNumber)) {
      return 'Número de teléfono inválido. Debe tener 10 dígitos.';
    }

    // Validar RFC
    if (customer.rfc.isEmpty ||
        !RegExp(r'^[a-zA-Z]{4}\d{6}[a-zA-Z]{2}\d{1}$').hasMatch(customer.rfc)) {
      return 'RFC inválido. Debe tener el formato 4 letras, 6 dígitos, 2 letras, 1 dígito.';
    }

    // Validar contraseña
    if (customer.password.isEmpty ||
        !RegExp(r'.{8,}').hasMatch(customer.password)) {
      return 'Contraseña inválida. Debe tener al menos 8 caracteres.';
    }

    return null;
  }
}
