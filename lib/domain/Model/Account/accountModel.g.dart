// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'accountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as int?,
    idUser: json['id_user'] as int,
    balance: (json['balance'] as num).toDouble(),
    status: json['status'] as int,
    cards: (json['card'] as List<dynamic>?)
        ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
        .toList(),
    usuario: json['user'] == null
        ? null
        : Customer.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'balance': instance.balance,
      'status': instance.status,
      'card': instance.cards?.map((e) => e.toJson()).toList(),
      'usuario': instance.usuario?.toJson(),
    };
