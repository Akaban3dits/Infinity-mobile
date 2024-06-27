import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountNumberChanged extends AccountEvent {
  final String accountNumber;
  const AccountNumberChanged(this.accountNumber);

  @override
  List<Object> get props => [accountNumber];
}

class AccountTypeChanged extends AccountEvent {
  final String accountType;
  const AccountTypeChanged(this.accountType);

  @override
  List<Object> get props => [accountType];
}

class BalanceChanged extends AccountEvent {
  final double balance;
  const BalanceChanged(this.balance);

  @override
  List<Object> get props => [balance];
}

class PhotoChanged extends AccountEvent {
  final String photo;
  const PhotoChanged(this.photo);

  @override
  List<Object> get props => [photo];
}

class PasswordChanged extends AccountEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoadAccountDataEvent extends AccountEvent {}
