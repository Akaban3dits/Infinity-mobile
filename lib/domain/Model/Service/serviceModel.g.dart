// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as bool,
    icono: json['icono'] as String,
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'icono': instance.icono,
    };
