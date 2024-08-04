// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'cardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    id: json['id'] as int?,
    idAccount: json['id_account'] as int?,
    card: json['card'] as String,
    cardAccount: json['card_account'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'id_account': instance.idAccount,
      'card': instance.card,
      'card_account': instance.cardAccount,
      'status': instance.status,
    };
