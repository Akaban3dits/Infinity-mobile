import 'package:infinity_bank/domain/models/Updated/Account/accountModel.dart';

abstract class AccountRepository {
  Future<Account> loadAccountData();
}
