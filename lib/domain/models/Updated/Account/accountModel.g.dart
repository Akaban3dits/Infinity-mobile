// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      accountNumber: json['accountNumber'] as String,
      accountType: json['accountType'] as String,
      balance: (json['balance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'balance': instance.balance,
      'createdAt': instance.createdAt.toIso8601String(),
    };
