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
  }

  Future<void> _onGetTransferencesEvent(
      GetTransferencesEvent event, Emitter<TransferenceState> emit) async {
    emit(TransferenceLoading());
    try {
      final transferences = await getTransferencesUseCase.call();
      emit(TransferencesLoaded(transferences));
    } catch (e) {
      emit(TransferenceError("Error obtaining transfers: $e"));
    }
  }

  Future<void> _onCreateTransferenceEvent(
      CreateTransferenceEvent event, Emitter<TransferenceState> emit) async {
    emit(TransferenceLoading());
    try {
      final errorMessage = await createTransferenceUseCase.call(event.transference);
      if (errorMessage == null) {
        emit(TransferenceCreated(event.transference));
      } else {
        emit(TransferenceError(errorMessage));
      }
    } catch (e) {
      emit(TransferenceError("Error creating transfer: $e"));
    }
  }
}
