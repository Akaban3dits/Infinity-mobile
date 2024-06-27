import 'package:infinity_bank/domain/models/Updated/Account/accountModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Account/account_repository.dart';

class LoadAccountData {
  final AccountRepository repository;
  LoadAccountData(this.repository);
  Future<Account> call() async {
    return await repository.loadAccountData();
  }
}
