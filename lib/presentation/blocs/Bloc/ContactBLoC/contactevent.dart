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

class NickNameChanged extends ContactEvent {
  final String nickname;
  const NickNameChanged(this.nickname);

  @override
  List<Object> get props => [nickname];
}

class EmailChanged extends ContactEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends ContactEvent {
  final String phone;
  const PhoneNumberChanged(this.phone);

  @override
  List<Object> get props => [phone];
}

class BankNameChanged extends ContactEvent {
  final String bankname;
  const BankNameChanged(this.bankname);

  @override
  List<Object> get props => [bankname];
}

class AccountNumberChanged extends ContactEvent {
  final String account;
  const AccountNumberChanged(this.account);

  @override
  List<Object> get props => [account];
}
