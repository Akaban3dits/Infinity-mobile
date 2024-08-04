import 'package:infinity_bank/domain/Model/Account/accountModel.dart';

abstract class AccountRepository {
  Future<Account> getAccount();
  Future<bool> updateAccount(int id, Account account);
  Future<bool> deleteAccount(int id);
}
