import 'package:infinity_bank/domain/Repository/Account/account_repository.dart';
import 'package:infinity_bank/domain/Model/Account/accountModel.dart';
import 'package:infinity_bank/domain/Usecases/Account/accountvalidator.dart';

class GetAccountUseCase {
  final AccountRepository repository;

  GetAccountUseCase(this.repository);

  Future<Account> call() async {
    final account = await repository.getAccount();

    if (!isValidAccount(account)) {
      throw Exception("Datos de cuenta inválidos");
    }

    return account;
  }

  bool isValidAccount(Account account) {
    return AccountValidator.validate(account) == null;
  }
}
