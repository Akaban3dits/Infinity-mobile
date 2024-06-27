// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      contactName: json['contactName'] as String,
      contactAccountNumber: json['contactAccountNumber'] as String
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'contactName': instance.contactName,
      'contactAccountNumber': instance.contactAccountNumber
    };
