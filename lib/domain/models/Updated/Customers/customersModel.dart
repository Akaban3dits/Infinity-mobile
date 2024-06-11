import 'package:json_annotation/json_annotation.dart';
part 'customersModel.g.dart';

@JsonSerializable()
class Customer {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String rfc;
  String password;
  int idbank;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.rfc,
    required this.password,
    required this.idbank
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
