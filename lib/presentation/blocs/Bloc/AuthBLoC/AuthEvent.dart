import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String phone;
  final String password;

  const AuthLoginRequested(this.phone, this.password);

  @override
  List<Object?> get props => [phone, password];
}

class AuthLogoutRequested extends AuthEvent {}
