import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object?> get props => [];
}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final Customer customer;

  const CustomerLoaded(this.customer);

  @override
  List<Object?> get props => [customer];

  CustomerLoaded copyWith({
    Customer? customer,
  }) {
    return CustomerLoaded(
      customer ?? this.customer,
    );
  }
}

class CustomerCreated extends CustomerState {
  final Customer customer;

  const CustomerCreated(this.customer);

  @override
  List<Object?> get props => [customer];
}

class CustomerUpdated extends CustomerState {}

class CustomerError extends CustomerState {
  final String message;

  const CustomerError(this.message);

  @override
  List<Object?> get props => [message];
}
