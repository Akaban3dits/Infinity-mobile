import 'package:infinity_bank/domain/models/Updated/Transaction/transactionModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Transaction/transaction_repository.dart';

class LoadTransactionData {
  final TransactionRepository repository;

  LoadTransactionData(this.repository);

  Future<Transaction> call() async {
    final transactionData = await repository.loadTransactionData();

    if (transactionData.transactionType.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(transactionData.transactionType)) {
      throw Exception("Transaction type cannot be empty or invalid");
    }
    if (transactionData.amount.isNegative) {
      throw Exception("Amount cannot be negative");
    }
    if (transactionData.description.isEmpty) {
      throw Exception("Description cannot be empty");
    }

    return transactionData;
  }
}
