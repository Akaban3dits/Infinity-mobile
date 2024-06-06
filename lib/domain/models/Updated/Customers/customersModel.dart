import 'package:json_annotation/json_annotation.dart';
part 'customersModel.g.dart';

@JsonSerializable()
class Customer {
  int id;
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String email;
  String phoneNumber;
  String address;
  DateTime createdAt;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
