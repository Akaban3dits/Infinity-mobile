import 'package:json_annotation/json_annotation.dart';
part 'contactModel.g.dart';

@JsonSerializable()
class Contact {
  int id;
  int customerId;
  String contactName;
  String contactAccountNumber;
  DateTime createdAt;

  Contact({
    required this.id,
    required this.customerId,
    required this.contactName,
    required this.contactAccountNumber,
    required this.createdAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
