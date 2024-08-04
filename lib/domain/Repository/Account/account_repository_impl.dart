import 'package:infinity_bank/domain/ApiProvider/Account/accountProvider.dart';
import 'package:infinity_bank/domain/Model/Account/accountModel.dart';
import 'package:infinity_bank/domain/Repository/Account/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountProvider _provider;

  AccountRepositoryImpl(this._provider);

  @override
  Future<Account> getAccount() async {
    try {
      final account = await _provider.getAccountData();
      return account;
    } catch (e) {
      throw Exception("Failed to get account: $e");
    }
  }

  @override
  Future<bool> updateAccount(int id, Account account) async {
    try {
      await _provider.updateAccount(id, account.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAccount(int id) async {
    try {
      await _provider.deleteAccount(id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
