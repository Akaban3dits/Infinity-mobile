// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'customersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'createdAt': instance.createdAt.toIso8601String(),
    };
