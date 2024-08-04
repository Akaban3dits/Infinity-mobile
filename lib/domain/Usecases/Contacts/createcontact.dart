import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';
import 'package:infinity_bank/domain/Usecases/Contacts/contactvalidator.dart';

class CreateContactUseCase {
  final ContactRepository repository;

  CreateContactUseCase(this.repository);

  Future<String?> call(Contact contact) async {
    final errorMessage = ContactValidator.validate(contact);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.createContact(contact);
    } catch (e) {
      return 'Error al crear el contacto: $e';
    }
    return null;
  }
}
