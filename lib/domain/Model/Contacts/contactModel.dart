import 'package:json_annotation/json_annotation.dart';

part 'contactModel.g.dart';

@JsonSerializable()
class Contact {
  int? id;
  int idUser;
  String nickname;
  String email;
  String phone;
  String bankname;
  String account;

  Contact({
    this.id,
    required this.idUser,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.bankname,
    required this.account,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
