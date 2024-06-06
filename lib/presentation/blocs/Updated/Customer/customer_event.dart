import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
  @override
  List<Object> get props => [];
}

class LoadCustomerDataEvent extends CustomerEvent {}
