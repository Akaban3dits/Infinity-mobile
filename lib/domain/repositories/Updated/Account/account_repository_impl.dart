import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/Updated/Account/accountModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Account/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository{
  @override
  Future<Account> loadAccountData() async {
    final response = await rootBundle.loadString('assets/json/account.json');
    final data = json.decode(response);
    return Account.fromJson(data);
  }
}
