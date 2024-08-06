import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository.dart';
import 'package:infinity_bank/domain/Usecases/Log_Service/createlogservice.dart';
import 'package:infinity_bank/domain/Usecases/Log_Service/getlogservices.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logserviceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logservicestate.dart';

class LogServiceBloc extends Bloc<LogServiceEvent, LogServiceState> {
  final CreateLogServiceUseCase createLogServiceUseCase;
  final GetLogServicesUseCase getLogServicesUseCase;

  LogServiceBloc({
    required LogServiceRepository repository,
  })  : createLogServiceUseCase = CreateLogServiceUseCase(repository),
        getLogServicesUseCase = GetLogServicesUseCase(repository),
        super(LogServiceInitial()) {
    on<GetLogServicesEvent>(_onGetLogServicesEvent);
    on<CreateLogServiceEvent>(_onCreateLogServiceEvent);
  }

  Future<void> _onGetLogServicesEvent(GetLogServicesEvent event, Emitter<LogServiceState> emit) async {
    emit(LogServiceLoading());
    try {
      final logServices = await getLogServicesUseCase.call();
      emit(LogServicesLoaded(logServices));
    } catch (e) {
      emit(LogServiceError("Error obtaining log services: $e"));
    }
  }

  Future<void> _onCreateLogServiceEvent(CreateLogServiceEvent event, Emitter<LogServiceState> emit) async {
    emit(LogServiceLoading());
    try {
      final errorMessage = await createLogServiceUseCase.call(event.logService);
      if (errorMessage == null) {
        emit(LogServiceCreated(event.logService));
      } else {
        emit(LogServiceError(errorMessage));
      }
    } catch (e) {
      emit(LogServiceError("Error creating log service: $e"));
    }
  }
}
