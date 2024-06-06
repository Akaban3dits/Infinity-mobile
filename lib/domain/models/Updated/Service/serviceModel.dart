import 'package:json_annotation/json_annotation.dart';
part 'serviceModel.g.dart';

@JsonSerializable()
class Service {
  int id;
  String serviceName;
  String serviceDescription;

  Service({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
