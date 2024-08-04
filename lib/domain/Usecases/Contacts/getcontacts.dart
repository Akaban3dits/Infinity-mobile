import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';

class GetContactsUseCase {
  final ContactRepository repository;

  GetContactsUseCase(this.repository);

  Future<List<Contact>> call() async {
    try {
      final contacts = await repository.getContacts();
      return contacts;
    } catch (e) {
      throw Exception("Error al obtener los contactos: $e");
    }
  }
}
