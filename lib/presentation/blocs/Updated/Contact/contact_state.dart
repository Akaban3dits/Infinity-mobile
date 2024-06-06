import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Contact/contactModel.dart';

class ContactState extends Equatable {
  final int id;
  final int customerId;
  final String contactName;
  final String contactAccountNumber;
  final DateTime createdAt;

  ContactState({
    this.id = 0,
    this.customerId = 0,
    this.contactName = '',
    this.contactAccountNumber = '',
    required this.createdAt,
  });

  ContactState copyWith({
    int? id,
    int? customerId,
    String? contactName,
    String? contactAccountNumber,
    DateTime? createdAt,
  }) {
    return ContactState(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      contactName: contactName ?? this.contactName,
      contactAccountNumber: contactAccountNumber ?? this.contactAccountNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props =>
      [id, customerId, contactName, contactAccountNumber, createdAt];

  factory ContactState.fromModel(Contact model) {
    return ContactState(
      id: model.id,
      customerId: model.customerId,
      contactName: model.contactName,
      contactAccountNumber: model.contactAccountNumber,
      createdAt: model.createdAt,
    );
  }
}
