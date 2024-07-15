import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';

class CustomerState extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String rfc;
  final int idbank;

  const CustomerState({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phoneNumber = '',
    this.idbank = 0,
    this.password = '',
    this.rfc = ''
  });

  CustomerState copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? rfc,
    int? idbank,
  }) {
    return CustomerState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      rfc: rfc ?? this.rfc,
      idbank: idbank ?? this.idbank,
    );
  }

  @override
  List<Object> get props => [id, firstName, lastName, password, idbank, rfc, email, phoneNumber];

  factory CustomerState.fromModel(Customer model) {
    return CustomerState(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      phoneNumber: model.phoneNumber,
      password: model.password,
      rfc: model.rfc,
      idbank: model.idbank,
    );
  }

  factory CustomerState.fromJson(Map<String, dynamic> json) {
    return CustomerState(
      id: json['id'],
      firstName: json['name'],
      lastName: json['lastname'],
      email: json['email'],
      phoneNumber: json['phone'],
      password: json['password'],
      rfc: json['rfc'],
      idbank: json['id_bank'],
    );
  }
}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final Customer customerData;
  const CustomerLoaded(this.customerData);

  @override
  List<Object> get props => [customerData];
}

class CustomerError extends CustomerState {
  final String message;
  const CustomerError(this.message);

  @override
  List<Object> get props => [message];
}

class CustomerRegistered extends CustomerState {}

class UserUpdated extends CustomerState {}
