import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

abstract class TransferenceState extends Equatable {
  const TransferenceState();

  @override
  List<Object?> get props => [];
}

class TransferenceInitial extends TransferenceState {}

class TransferenceLoading extends TransferenceState {}

class TransferencesLoaded extends TransferenceState {
  final List<Transference> transferences;

  const TransferencesLoaded(this.transferences);

  @override
  List<Object?> get props => [transferences];
}

class TransferenceCreated extends TransferenceState {
  final Transference transference;

  const TransferenceCreated(this.transference);

  @override
  List<Object?> get props => [transference];
}

class TransferenceError extends TransferenceState {
  final String message;

  const TransferenceError(this.message);

  @override
  List<Object?> get props => [message];
}
