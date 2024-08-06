import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Transference/transference_repository.dart';
import 'package:infinity_bank/domain/Usecases/Transference/createtransference.dart';
import 'package:infinity_bank/domain/Usecases/Transference/gettransferences.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferenceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencestate.dart';

class TransferenceBloc extends Bloc<TransferenceEvent, TransferenceState> {
  final CreateTransferenceUseCase createTransferenceUseCase;
  final GetTransferencesUseCase getTransferencesUseCase;

  TransferenceBloc({
    required TransferenceRepository repository,
  })  : createTransferenceUseCase = CreateTransferenceUseCase(repository),
        getTransferencesUseCase = GetTransferencesUseCase(repository),
        super(TransferenceInitial()) {
    on<GetTransferencesEvent>(_onGetTransferencesEvent);
    on<CreateTransferenceEvent>(_onCreateTransferenceEvent);
    on<ConceptChanged>(_onConceptChanged);
    on<AmountChanged>(_onAmountChanged);
    on<AccountChanged>(_onAccountChanged);
  }

  void _onConceptChanged(ConceptChanged event, Emitter<TransferenceState> emit) {
    if (state is TransferenceEditing) {
      final updatedTransference = (state as TransferenceEditing).transference
          .copyWith(concept: event.concept);
      emit(TransferenceEditing(updatedTransference));
    }
  }

  void _onAmountChanged(AmountChanged event, Emitter<TransferenceState> emit) {
    if (state is TransferenceEditing) {
      final updatedTransference = (state as TransferenceEditing).transference
          .copyWith(amount: event.amount);
      emit(TransferenceEditing(updatedTransference));
    }
  }

  void _onAccountChanged(AccountChanged event, Emitter<TransferenceState> emit) {
    if (state is TransferenceEditing) {
      final updatedTransference = (state as TransferenceEditing).transference
          .copyWith(receptorAccount: event.account);
      emit(TransferenceEditing(updatedTransference));
    }
  }

  Future<void> _onGetTransferencesEvent(
    GetTransferencesEvent event, Emitter<TransferenceState> emit) async {
    emit(TransferenceLoading());
    try {
      final transferences = await getTransferencesUseCase.call();
      emit(TransferencesLoaded(transferences));
    } catch (e) {
      emit(TransferenceError("Error obteniendo las transferencias: $e"));
    }
  }

  Future<void> _onCreateTransferenceEvent(
    CreateTransferenceEvent event, Emitter<TransferenceState> emit) async {
  emit(TransferenceLoading());

  try {
    final errorMessage = await createTransferenceUseCase.call(event.transference);
    
    if (errorMessage == null) {
      add(GetTransferencesEvent());
      emit(TransferenceCreated(event.transference));
    } else {
      emit(TransferenceError(errorMessage));
    }
  } catch (e) {
    emit(TransferenceError("Error creando la transferencia: $e"));
  }
}

}
