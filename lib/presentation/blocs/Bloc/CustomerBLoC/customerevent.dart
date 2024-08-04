import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

class FirstNameChanged extends CustomerEvent {
  final String firstName;
  const FirstNameChanged(this.firstName);

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends CustomerEvent {
  final String lastName;
  const LastNameChanged(this.lastName);

  @override
  List<Object> get props => [lastName];
}

class EmailChanged extends CustomerEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends CustomerEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RFCChanged extends CustomerEvent {
  final String rfc;
  const RFCChanged(this.rfc);

  @override
  List<Object> get props => [rfc];
}

class PhoneNumberChanged extends CustomerEvent {
  final String phoneNumber;
  const PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}


class GetCustomerEvent extends CustomerEvent {}

class CreateCustomerEvent extends CustomerEvent {
  final Customer customer;

  const CreateCustomerEvent(this.customer);

  @override
  List<Object?> get props => [customer];
}

class UpdateCustomerEvent extends CustomerEvent {
  final Customer customer;

  const UpdateCustomerEvent(this.customer);

  @override
  List<Object?> get props => [customer];
}
