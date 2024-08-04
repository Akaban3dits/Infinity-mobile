import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Account/accountModel.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final Account account;

  const AccountLoaded(this.account);

  @override
  List<Object?> get props => [account];

  AccountLoaded copyWith({
    Account? account,
  }) {
    return AccountLoaded(
      account ?? this.account,
    );
  }
}

class AccountUpdated extends AccountState {}

class AccountDeleted extends AccountState {}

class AccountError extends AccountState {
  final String message;

  const AccountError(this.message);

  @override
  List<Object?> get props => [message];
}
