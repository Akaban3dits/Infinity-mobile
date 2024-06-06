import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/customersModel.dart';

class CustomerState extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String email;
  final String phoneNumber;
  final String address;
  final DateTime createdAt;

  CustomerState({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    required this.dateOfBirth,
    this.email = '',
    this.phoneNumber = '',
    this.address = '',
    required this.createdAt,
  });

  CustomerState copyWith({
    int? id,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? email,
    String? phoneNumber,
    String? address,
    DateTime? createdAt,
  }) {
    return CustomerState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props => [id, firstName, lastName, dateOfBirth, email, phoneNumber, address, createdAt];

  factory CustomerState.fromModel(Customer model) {
    return CustomerState(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      dateOfBirth: model.dateOfBirth,
      email: model.email,
      phoneNumber: model.phoneNumber,
      address: model.address,
      createdAt: model.createdAt,
    );
  }
}
