import 'package:json_annotation/json_annotation.dart';

part 'serviceModel.g.dart';

@JsonSerializable()
class Service {
  int id;
  String name;
  bool status;
  String icono;

  Service({
    required this.id,
    required this.name,
    required this.status,
    required this.icono,
  });

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
