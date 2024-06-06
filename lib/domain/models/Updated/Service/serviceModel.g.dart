// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as int,
      serviceName: json['serviceName'] as String,
      serviceDescription: json['serviceDescription'] as String,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'serviceName': instance.serviceName,
      'serviceDescription': instance.serviceDescription,
    };
