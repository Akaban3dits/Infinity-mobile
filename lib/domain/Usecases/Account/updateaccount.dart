import 'package:infinity_bank/domain/Repository/Account/account_repository.dart';
import 'package:infinity_bank/domain/Model/Account/accountModel.dart';
import 'package:infinity_bank/domain/Usecases/Account/accountvalidator.dart';

class UpdateAccountUseCase {
  final AccountRepository repository;

  UpdateAccountUseCase(this.repository);

  Future<bool> call(Account account) async {
    final errorMessage = AccountValidator.validate(account);
    if (errorMessage != null) {
      throw Exception(errorMessage);
    }
    try {
      return await repository.updateAccount(account.id, account);
    } catch (e) {
      throw Exception('Error al actualizar la cuenta: $e');
    }
  }
}
