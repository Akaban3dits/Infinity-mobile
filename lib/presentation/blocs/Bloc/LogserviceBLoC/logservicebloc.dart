import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository.dart';
import 'package:infinity_bank/domain/Usecases/Log_Service/createlogservice.dart';
import 'package:infinity_bank/domain/Usecases/Log_Service/getlogservices.dart';
import 'package:infinity_bank/domain/Usecases/Log_Service/getlogservice.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logserviceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logservicestate.dart';

class LogServiceBloc extends Bloc<LogServiceEvent, LogServiceState> {
  final CreateLogServiceUseCase createLogServiceUseCase;
  final GetLogServicesUseCase getLogServicesUseCase;
  final GetLogServiceUseCase getLogServiceUseCase;

  LogServiceBloc({
    required LogServiceRepository repository,
  })  : createLogServiceUseCase = CreateLogServiceUseCase(repository),
        getLogServicesUseCase = GetLogServicesUseCase(repository),
        getLogServiceUseCase = GetLogServiceUseCase(repository),
        super(LogServiceInitial()) {
    on<GetLogServicesEvent>(_onGetLogServicesEvent);
    on<CreateLogServiceEvent>(_onCreateLogServiceEvent);
    on<GetLogServiceEvent>(_onGetLogServiceEvent);
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

  Future<void> _onGetLogServiceEvent(GetLogServiceEvent event, Emitter<LogServiceState> emit) async {
    emit(LogServiceLoading());
    try {
      final logService = await getLogServiceUseCase.call(event.id);
      emit(LogServiceLoaded(logService));
    } catch (e) {
      emit(LogServiceError("Error obtaining log service: $e"));
    }
  }
}
