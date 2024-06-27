// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicepaymentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicePayment _$ServicePaymentFromJson(Map<String, dynamic> json) =>
    ServicePayment(
      id: json['id'] as int,
      accountId: json['accountId'] as int,
      serviceId: json['serviceId'] as int,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ServicePaymentToJson(ServicePayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'serviceId': instance.serviceId,
      'amount': instance.amount,
      'description': instance.description,
    };
