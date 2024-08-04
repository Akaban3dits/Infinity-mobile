import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';

class DeleteContactUseCase {
  final ContactRepository repository;

  DeleteContactUseCase(this.repository);

  Future<String?> call(int id) async {
    try {
      await repository.deleteContact(id);
    } catch (e) {
      return 'Error al eliminar el contacto: $e';
    }
    return null;
  }
}
