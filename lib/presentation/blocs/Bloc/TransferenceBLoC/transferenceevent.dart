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
