import 'package:json_annotation/json_annotation.dart';

part 'cardModel.g.dart';

@JsonSerializable()
class Card {
  int? id;
  int? idAccount;
  String card;
  String cardAccount;
  int status;

  Card({
    this.id,
    this.idAccount,
    required this.card,
    required this.cardAccount,
    required this.status,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
