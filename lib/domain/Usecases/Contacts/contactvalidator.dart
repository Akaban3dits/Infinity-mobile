import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';

class ContactValidator {
  static String? validate(Contact contact) {
    if (contact.nickname.isEmpty ||
        RegExp(r'[^\w\sáéíóúÁÉÍÓÚñÑüÜ]').hasMatch(contact.nickname) ||
        RegExp(r'\d').hasMatch(contact.nickname) ||
        contact.nickname.length < 3) {
      return 'El apodo no puede contener caracteres especiales, números o ser inferior a 3 caracteres.';
    }

    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(contact.email)) {
      return 'El correo electrónico no es válido.';
    }

    if (!RegExp(r'^\d{10,}$').hasMatch(contact.phone)) {
      return 'El teléfono debe tener al menos 10 dígitos.';
    }

    if (contact.bankname.isEmpty || contact.bankname.length < 3) {
      return 'El nombre del banco debe tener al menos 3 caracteres y no puede estar vacío.';
    }

    if (!RegExp(r'^\d{16}$').hasMatch(contact.account)) {
      return 'La cuenta debe tener exactamente 16 caracteres numéricos.';
    }

    return null;
  }
}
