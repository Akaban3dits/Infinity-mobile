import 'package:json_annotation/json_annotation.dart';

part 'transferenceModel.g.dart';

@JsonSerializable()
class Transference {
  int? id;
  int? idSender;
  int? idReceptor;
  double amount;
  String senderAccount;
  String receptorAccount;
  String concept;
  String owner;

  Transference({
    this.id,
    this.idSender,
    this.idReceptor,
    required this.amount,
    required this.senderAccount,
    required this.receptorAccount,
    required this.concept,
    required this.owner,
  });

  // Factory method to create a Transference instance from a JSON object
  factory Transference.fromJson(Map<String, dynamic> json) => _$TransferenceFromJson(json);

  // Method to convert a Transference instance into a JSON object
  Map<String, dynamic> toJson() => _$TransferenceToJson(this);

  // Factory method to create a Transference instance from the GET response JSON object
  factory Transference.fromGetJson(Map<String, dynamic> json) {
    return Transference(
      id: json['id'] as int?,
      idSender: json['id_sender'] as int?,
      idReceptor: json['id_receptor'] as int?,
      amount: (json['amount'] as num).toDouble(),
      senderAccount: json['sender_account'] as String,
      receptorAccount: json['receptor_account'] as String,
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );
  }

  Map<String, dynamic> toPostJson() {
    return <String, dynamic>{
      'id': id,
      'id_sender': idSender,
      'id_receptor': idReceptor,
      'amount': amount,
      'user_account': senderAccount, 
      'receptor_account': receptorAccount,
      'concept': concept,
      'owner': owner,
    };
  }

  Transference copyWith({
    int? id,
    int? idSender,
    int? idReceptor,
    double? amount,
    String? senderAccount,
    String? receptorAccount,
    String? concept,
    String? owner,
  }) {
    return Transference(
      id: id ?? this.id,
      idSender: idSender ?? this.idSender,
      idReceptor: idReceptor ?? this.idReceptor,
      amount: amount ?? this.amount,
      senderAccount: senderAccount ?? this.senderAccount,
      receptorAccount: receptorAccount ?? this.receptorAccount,
      concept: concept ?? this.concept,
      owner: owner ?? this.owner,
    );
  }
}
