import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Contact/contactModel.dart';

class ContactState extends Equatable {
  final int id;
  final int customerId;
  final String contactName;
  final String contactAccountNumber;

  const ContactState({
    this.id = 0,
    this.customerId = 0,
    this.contactName = '',
    this.contactAccountNumber = ''
  });

  ContactState copyWith({
    int? id,
    int? customerId,
    String? contactName,
    String? contactAccountNumber
  }) {
    return ContactState(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      contactName: contactName ?? this.contactName,
      contactAccountNumber: contactAccountNumber ?? this.contactAccountNumber
    );
  }

  @override
  List<Object> get props =>
      [id, customerId, contactName, contactAccountNumber];

  factory ContactState.fromModel(Contact model) {
    return ContactState(
      id: model.id,
      customerId: model.customerId,
      contactName: model.contactName,
      contactAccountNumber: model.contactAccountNumber
    );
  }
}
