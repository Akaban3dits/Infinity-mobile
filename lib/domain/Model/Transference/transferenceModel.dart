import 'package:json_annotation/json_annotation.dart';

part 'transferenceModel.g.dart';

@JsonSerializable()
class Transference {
  int? id;
  int idSender;
  int idReceptor;
  double amount;
  String senderAccount;
  String receptorAccount;
  String concept;
  String owner;

  Transference({
    this.id,
    required this.idSender,
    required this.idReceptor,
    required this.amount,
    required this.senderAccount,
    required this.receptorAccount,
    required this.concept,
    required this.owner,
  });

  factory Transference.fromJson(Map<String, dynamic> json) => _$TransferenceFromJson(json);

  Map<String, dynamic> toJson() => _$TransferenceToJson(this);
}
