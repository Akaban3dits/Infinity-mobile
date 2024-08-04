import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';

class GetContactUseCase {
  final ContactRepository repository;

  GetContactUseCase(this.repository);

  Future<Contact> call(int id) async {
    try {
      return await repository.getContact(id);
    } catch (e) {
      throw Exception("Error al obtener el contacto: $e");
    }
  }
}
