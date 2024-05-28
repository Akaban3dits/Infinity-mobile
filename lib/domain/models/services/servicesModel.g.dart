// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicesModel.dart';

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) => ServicesModel(
      servname: json['servname'] as String,
      tip_s: (json['tip_s'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) => <String, dynamic>{
      'servname': instance.servname,
      'url': instance.url,
      'tip_s': instance.tip_s,
    };
