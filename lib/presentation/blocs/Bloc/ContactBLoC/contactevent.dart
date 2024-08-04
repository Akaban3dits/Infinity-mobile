import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

class GetContactsEvent extends ContactEvent {}

class CreateContactEvent extends ContactEvent {
  final Contact contact;

  const CreateContactEvent(this.contact);

  @override
  List<Object?> get props => [contact];
}

class UpdateContactEvent extends ContactEvent {
  final int id;
  final Contact contact;

  const UpdateContactEvent(this.id, this.contact);

  @override
  List<Object?> get props => [id, contact];
}

class DeleteContactEvent extends ContactEvent {
  final int id;

  const DeleteContactEvent(this.id);

  @override
  List<Object?> get props => [id];
}
