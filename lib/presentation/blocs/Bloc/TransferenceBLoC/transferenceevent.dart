import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

abstract class TransferenceEvent extends Equatable {
  const TransferenceEvent();

  @override
  List<Object?> get props => [];
}

class GetTransferencesEvent extends TransferenceEvent {}

class CreateTransferenceEvent extends TransferenceEvent {
  final Transference transference;

  const CreateTransferenceEvent(this.transference);

  @override
  List<Object?> get props => [transference];
}

class ConceptChanged extends TransferenceEvent {
  final String concept;

  const ConceptChanged(this.concept);

  @override
  List<Object> get props => [concept];
}

class AmountChanged extends TransferenceEvent {
  final double amount;

  const AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}
class AccountChanged extends TransferenceEvent {
  final String account;

  const AccountChanged(this.account);

  @override
  List<Object> get props => [account];
}

