import 'package:json_annotation/json_annotation.dart';

part 'log_serviceModel.g.dart';

@JsonSerializable()
class LogService {
  int id;
  String amount;
  String reference;
  int idService;
  int idUsers;
  int idAccount;

  LogService({
    required this.id,
    required this.amount,
    required this.reference,
    required this.idService,
    required this.idUsers,
    required this.idAccount,
  });

  factory LogService.fromJson(Map<String, dynamic> json) => _$LogServiceFromJson(json);

  Map<String, dynamic> toJson() => _$LogServiceToJson(this);
}
