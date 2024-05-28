// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movementsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

movementsModel _$movementsModelFromJson(Map<String, dynamic> json) =>
    movementsModel(
      usuario: json['usuario'] as String,
      monto: (json['monto'] as num).toDouble(),
      fecha: json['fecha'] as String,
      tipo: json['tipo'] as String,
      estado: json['estado'] as String,
      detalle: json['detalle'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$movementsModelToJson(movementsModel instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'monto': instance.monto,
      'fecha': instance.fecha,
      'tipo': instance.tipo,
      'estado': instance.estado,
      'detalle': instance.detalle,
      'id': instance.id,
      'url': instance.url,
    };
