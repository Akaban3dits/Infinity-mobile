import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';
import 'package:infinity_bank/domain/Usecases/Contacts/contactvalidator.dart';

class UpdateContactUseCase {
  final ContactRepository repository;

  UpdateContactUseCase(this.repository);

  Future<String?> call(int id, Contact contact) async {
    final errorMessage = ContactValidator.validate(contact);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.updateContact(id, contact);
    } catch (e) {
      return 'Error al actualizar el contacto: $e';
    }
    return null;
  }
}
