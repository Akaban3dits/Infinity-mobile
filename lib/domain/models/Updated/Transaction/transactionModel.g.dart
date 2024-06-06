// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as int,
      accountId: json['accountId'] as int,
      transactionType: json['transactionType'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'transactionType': instance.transactionType,
      'amount': instance.amount,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'description': instance.description,
    };
