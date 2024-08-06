// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferenceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transference _$TransferenceFromJson(Map<String, dynamic> json) {
  return Transference(
    id: json['id'] as int?,
    idSender: json['id_sender'] as int?,
    idReceptor: json['id_receptor'] as int?,
    amount: (json['amount'] as num).toDouble(),
    senderAccount: json['sender_account'] as String? ?? '',
    receptorAccount: json['receptor_account'] as String? ?? '',
    concept: json['concept'] as String? ?? '',
    owner: json['owner'] as String? ?? '',
  );
}

Map<String, dynamic> _$TransferenceToJson(Transference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_sender': instance.idSender,
      'id_receptor': instance.idReceptor,
      'amount': instance.amount,
      'sender_account': instance.senderAccount,
      'receptor_account': instance.receptorAccount,
      'concept': instance.concept,
      'owner': instance.owner,
    };
