// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'customersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['id'] as int? ?? 0,
    firstName: json['name'] as String? ?? '',
    lastName: json['lastname'] as String? ?? '',
    email: json['email'] as String? ?? '',
    phoneNumber: json['phone'] as String? ?? '',
    rfc: json['rfc'] as String? ?? '',
    password: json['password'] as String? ?? '',
    idbank: json['id_bank'] as int? ?? 0,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.firstName,
      'lastname': instance.lastName,
      'email': instance.email,
      'phone': instance.phoneNumber,
      'rfc': instance.rfc,
      'password': instance.password,
      'id_bank': instance.idbank,
    };
