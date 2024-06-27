import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Account/accountModel.dart';

class AccountState extends Equatable {
  final int id;
  final int customerId;
  final String accountNumber;
  final String accountType;
  final double balance;
  final String photo;
  final String password;

  const AccountState({
    this.id = 0,
    this.customerId = 0,
    this.accountNumber = '',
    this.accountType = '',
    this.balance = 0.0,
    this.password = '',
    this.photo = '',
  });

  AccountState copyWith({
    int? id,
    int? customerId,
    String? accountNumber,
    String? accountType,
    double? balance,
    String? photo,
    String? password,
  }) {
    return AccountState(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      accountNumber: accountNumber ?? this.accountNumber,
      accountType: accountType ?? this.accountType,
      balance: balance ?? this.balance,
      photo: photo ?? this.photo,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [id, customerId, accountNumber, accountType, balance, photo, password];

  factory AccountState.fromModel(Account model) {
    return AccountState(
      id: model.id,
      customerId: model.customerId,
      accountNumber: model.accountNumber,
      accountType: model.accountType,
      balance: model.balance,
      password: model.password,
      photo: model.photo,
    );
  }
}
