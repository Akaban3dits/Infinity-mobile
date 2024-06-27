import 'package:json_annotation/json_annotation.dart';

part 'accountModel.g.dart';

@JsonSerializable()
class Account {
  int id;
  int customerId;
  String accountNumber;
  String accountType;
  double balance;
  String photo;
  String password;

  Account({
    required this.id,
    required this.customerId,
    required this.accountNumber,
    required this.accountType,
    required this.balance,
    required this.photo,
    required this.password
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

