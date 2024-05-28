

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peopleModel.dart';

UsuarioModel _$UsuarioFromJson(Map<String, dynamic> json) => UsuarioModel(
      nombre: json['nombre'] as String,
      numeroDeCuenta: json['numeroDeCuenta'] as int,
      url: json['url'] as String,
    );

Map<String, dynamic> _$UsuarioToJson(UsuarioModel instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'numeroDeCuenta': instance.numeroDeCuenta,
      'url': instance.url,
    };
