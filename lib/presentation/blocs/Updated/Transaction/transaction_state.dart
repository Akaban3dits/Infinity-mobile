import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Transaction/transactionModel.dart';

class TransactionState extends Equatable {
  final int id;
  final int accountId;
  final String transactionType;
  final double amount;
  final String description;

  const TransactionState({
    this.id = 0,
    this.accountId = 0,
    this.transactionType = '',
    this.amount = 0.0,
    this.description = '',
  });

  TransactionState copyWith({
    int? id,
    int? accountId,
    String? transactionType,
    double? amount,
    String? description,
  }) {
    return TransactionState(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      transactionType: transactionType ?? this.transactionType,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props =>
      [id, accountId, transactionType, amount, description];

  factory TransactionState.fromModel(Transaction model) {
    return TransactionState(
      id: model.id,
      accountId: model.accountId,
      transactionType: model.transactionType,
      amount: model.amount,
      description: model.description,
    );
  }
}
