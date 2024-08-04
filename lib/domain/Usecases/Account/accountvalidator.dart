import 'package:infinity_bank/domain/Model/Account/accountModel.dart';

class AccountValidator {
  static String? validate(Account account) {
    if (account.balance < 0) {
      return 'El balance debe ser un número positivo.';
    }

    if (account.status < 0 || account.status > 2) {
      return 'Estado de cuenta inválido. Debe estar entre 0 y 2.';
    }

    return null;
  }
}
