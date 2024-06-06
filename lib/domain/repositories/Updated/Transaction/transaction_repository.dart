import 'package:infinity_bank/domain/models/Updated/Transaction/transactionModel.dart';

abstract class TransactionRepository {
  Future<Transaction> loadTransactionData();
}
