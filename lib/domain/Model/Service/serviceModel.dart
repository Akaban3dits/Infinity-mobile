import 'package:json_annotation/json_annotation.dart';

part 'serviceModel.g.dart';

@JsonSerializable()
class Service {
  final int id;
  final String name;
  final bool status;
  final String icono;

  Service({
    required this.id,
    required this.name,
    required this.status,
    required this.icono,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'] as String) ?? 0,
      name: json['name'] as String,
      status: json['status'] as bool,
      icono: json['icono'] as String,
    );
  }

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

}
