// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_serviceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogService _$LogServiceFromJson(Map<String, dynamic> json) {
  return LogService(
    id: json['id'] as int,
    amount: json['amount'] as String,
    reference: json['reference'] as String,
    idService: json['id_service'] as int,
    idUsers: json['id_users'] as int,
    idAccount: json['id_account'] as int,
  );
}

Map<String, dynamic> _$LogServiceToJson(LogService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'reference': instance.reference,
      'id_service': instance.idService,
      'id_users': instance.idUsers,
      'id_account': instance.idAccount,
    };
