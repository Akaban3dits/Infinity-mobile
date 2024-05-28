import 'package:json_annotation/json_annotation.dart';
part 'movementsModel.g.dart';

@JsonSerializable()
class movementsModel {
  String usuario;
  double monto; // Cambiado de String a double
  String fecha; // Cambiado de String a DateTime
  String tipo;
  String estado;
  String detalle;
  String id;
  String url;

  movementsModel(
      {required this.usuario,
      required this.monto,
      required this.fecha,
      required this.tipo,
      required this.estado,
      required this.detalle,
      required this.id,
      required this.url});

  factory movementsModel.fromJson(Map<String, dynamic> json) =>
      _$movementsModelFromJson(json);
  Map<String, dynamic> toJson() => _$movementsModelToJson(this);
}
