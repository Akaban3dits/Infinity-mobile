import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';

class CustomerValidator {
  static String? validate(Customer customer) {
    if (customer.firstName.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(customer.firstName)) {
      return 'Nombre inválido. Solo se permiten letras.';
    }
    if (customer.lastName.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(customer.lastName)) {
      return 'Apellido inválido. Solo se permiten letras.';
    }
    if (customer.email.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(customer.email)) {
      return 'Correo electrónico inválido.';
    }
    if (customer.phoneNumber.isEmpty ||
        !RegExp(r'^\d{10}$').hasMatch(customer.phoneNumber)) {
      return 'Número de teléfono inválido. Debe tener 10 dígitos.';
    }
    if (customer.rfc.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(customer.rfc)) {
      return 'RFC inválido. Solo se permiten letras y números.';
    }
    if (customer.password.isEmpty ||
        !RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]{8,12}$')
            .hasMatch(customer.password)) {
      return 'Contraseña inválida. Debe tener entre 8 y 12 caracteres y contener al menos un carácter especial.';
    }
    return null;
  }
}
