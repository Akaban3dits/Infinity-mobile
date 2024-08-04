import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Account/accountModel.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

class GetAccountEvent extends AccountEvent {}

class UpdateAccountEvent extends AccountEvent {
  final Account account;

  const UpdateAccountEvent(this.account);

  @override
  List<Object?> get props => [account];
}

class DeleteAccountEvent extends AccountEvent {
  final int accountId;

  const DeleteAccountEvent(this.accountId);

  @override
  List<Object?> get props => [accountId];
}

class AccountDataChanged extends AccountEvent {
  final Account account;

  const AccountDataChanged(this.account);

  @override
  List<Object?> get props => [account];
}
