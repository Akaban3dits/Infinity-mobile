import 'package:infinity_bank/domain/models/Updated/Transaction/transactionModel.dart';

class LoadTransactionData {
  Future<Transaction> call() async {
    return Transaction(
      id: 1,
      accountId: 1,
      transactionType: "Deposit",
      amount: 500.00,
      description: "Salary Deposit",
    );
  }
}
