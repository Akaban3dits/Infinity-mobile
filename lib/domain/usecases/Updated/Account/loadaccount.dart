import 'package:infinity_bank/domain/models/Updated/Account/accountModel.dart';

class LoadAccountData {
  Future<Account> call() async {
    return Account(
      id: 1,
      customerId: 1,
      accountNumber: "1234567890",
      accountType: "Checking",
      balance: 1500.50,
      createdAt: DateTime.now(),
    );
  }
}
