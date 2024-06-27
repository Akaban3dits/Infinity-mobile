import 'package:infinity_bank/domain/models/Updated/Account/accountModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Account/account_repository.dart';

class LoadAccountData {
  final AccountRepository repository;

  LoadAccountData(this.repository);

  Future<Account> call() async {
    final accountData = await repository.loadAccountData();

    if (accountData.accountNumber.isEmpty ||
        !RegExp(r'^\d{10,18}$').hasMatch(accountData.accountNumber)) {
      throw Exception("Account number cannot be empty or invalid");
    }
    if (accountData.accountType.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(accountData.accountType)) {
      throw Exception("Account type cannot be empty or invalid");
    }
    if (accountData.balance.isNegative) {
      throw Exception("Balance cannot be negative");
    }

    return accountData;
  }
}
