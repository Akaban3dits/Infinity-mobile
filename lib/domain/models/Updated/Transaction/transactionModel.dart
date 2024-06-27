import 'package:json_annotation/json_annotation.dart';
part 'transactionModel.g.dart';

@JsonSerializable()
class Transaction {
  int id;
  int accountId;
  String transactionType;
  double amount;
  String description;

  Transaction({
    required this.id,
    required this.accountId,
    required this.transactionType,
    required this.amount,
    required this.description,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
