import 'package:json_annotation/json_annotation.dart';

part 'peopleModel.g.dart';

@JsonSerializable()
class UsuarioModel {
  String nombre;
  int numeroDeCuenta;
  String url;

  UsuarioModel({required this.nombre, required this.numeroDeCuenta, required this.url});
  factory UsuarioModel.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
