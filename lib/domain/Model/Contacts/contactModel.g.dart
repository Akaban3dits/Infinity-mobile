// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'contactModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    id: json['id'] as int?,
    idUser: json['id_user'] as int,
    nickname: json['nickname'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    bankname: json['bankname'] as String,
    account: json['account'] as String,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'account': instance.account,
    };
