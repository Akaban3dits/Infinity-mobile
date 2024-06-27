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
      photo: json['photo'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'balance': instance.balance,
      'photo': instance.photo,
      'password': instance.password
    };
