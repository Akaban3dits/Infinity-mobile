import 'package:json_annotation/json_annotation.dart';
part 'servicepaymentModel.g.dart';

@JsonSerializable()
class ServicePayment {
  int id;
  int accountId;
  int serviceId;
  double amount;
  String description;

  ServicePayment({
    required this.id,
    required this.accountId,
    required this.serviceId,
    required this.amount,
    required this.description,
  });

  factory ServicePayment.fromJson(Map<String, dynamic> json) =>
      _$ServicePaymentFromJson(json);
  Map<String, dynamic> toJson() => _$ServicePaymentToJson(this);
}
