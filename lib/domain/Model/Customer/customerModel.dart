import 'package:json_annotation/json_annotation.dart';
part 'customerModel.g.dart';

@JsonSerializable()
class Customer {
  int? id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String rfc;
  String password;
  int idbank;

  Customer({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.rfc,
    required this.password,
    required this.idbank,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int? ?? 0,
      firstName: json['name'] as String? ?? '',
      lastName: json['lastname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone'] as String? ?? '',
      rfc: json['rfc'] as String? ?? '',
      password: json['password'] as String? ?? '',
      idbank: json['id_bank'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  Customer copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? rfc,
    String? password,
    int? idbank,
  }) {
    return Customer(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rfc: rfc ?? this.rfc,
      password: password ?? this.password,
      idbank: idbank ?? this.idbank,
    );
  }
}
