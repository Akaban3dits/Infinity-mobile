import 'package:json_annotation/json_annotation.dart';

part 'servicesModel.g.dart';

@JsonSerializable()
class ServicesModel {
  final String servname;
  final String url;
  final int tip_s;

  ServicesModel(
      {required this.servname, required this.url, required this.tip_s});

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);
}
