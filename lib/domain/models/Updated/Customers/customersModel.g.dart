// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'customersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      rfc: json['rfc'] as String,
      password: json['password'] as String,
      idbank: json['idbank'] as int
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'rfc': instance.rfc,
      'password': instance.password,
      'idbank': instance.idbank

    };
