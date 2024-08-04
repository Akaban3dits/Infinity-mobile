import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';

class ContactValidator {
  static String? validate(Contact contact) {
    if (contact.nickname.isEmpty || contact.nickname.length > 50) {
      return 'El apodo es inválido. No debe estar vacío ni exceder los 50 caracteres.';
    }
    if (contact.email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(contact.email)) {
      return 'Correo electrónico inválido.';
    }
    if (contact.phone.isEmpty || !RegExp(r'^\d+$').hasMatch(contact.phone)) {
      return 'Número de teléfono inválido. Solo se permiten números.';
    }
    if (contact.bankname.isEmpty) {
      return 'El nombre del banco no puede estar vacío.';
    }
    if (contact.account.isEmpty || !RegExp(r'^\d+$').hasMatch(contact.account)) {
      return 'Número de cuenta inválido. Solo se permiten números.';
    }
    return null;
  }
}
