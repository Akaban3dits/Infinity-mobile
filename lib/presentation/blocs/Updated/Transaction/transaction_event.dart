import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
  @override
  List<Object> get props => [];
}

class LoadTransactionDataEvent extends TransactionEvent {}
