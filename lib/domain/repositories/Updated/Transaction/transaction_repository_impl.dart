import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/Updated/Transaction/transactionModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Transaction/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<Transaction> loadTransactionData() async {
    final response = await rootBundle.loadString('assets/json/transaction.json');
    final data = json.decode(response);
    return Transaction.fromJson(data);
  }
}
