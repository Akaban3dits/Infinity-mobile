import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactsLoaded extends ContactState {
  final List<Contact> contacts;

  const ContactsLoaded(this.contacts);

  @override
  List<Object?> get props => [contacts];

  ContactsLoaded copyWith({
    List<Contact>? contacts,
  }) {
    return ContactsLoaded(
      contacts ?? this.contacts,
    );
  }
}


class ContactCreated extends ContactState {
  final Contact contact;

  const ContactCreated(this.contact);

  @override
  List<Object?> get props => [contact];

  
}

class ContactUpdated extends ContactState {}

class ContactDeleted extends ContactState {}

class ContactError extends ContactState {
  final String message;

  const ContactError(this.message);

  @override
  List<Object?> get props => [message];
}
