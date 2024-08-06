import 'package:infinity_bank/domain/Model/Account/Card/cardModel.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accountModel.g.dart';

@JsonSerializable()
class Account {
  int id;
  int idUser;
  double balance;
  int status;
  List<Card>? cards;
  Customer? usuario;

  Account({
    required this.id,
    required this.idUser,
    required this.balance,
    required this.status,
    this.cards,
    this.usuario,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
