import 'package:infinity_bank/domain/Repository/Account/account_repository.dart';

class DeleteAccountUseCase {
  final AccountRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<bool> call(int id) async {
    try {
      return await repository.deleteAccount(id);
    } catch (e) {
      throw Exception('Error al eliminar la cuenta: $e');
    }
  }
}
