import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';
import 'package:infinity_bank/domain/Usecases/Service/createservice.dart';
import 'package:infinity_bank/domain/Usecases/Service/deleteservice.dart';
import 'package:infinity_bank/domain/Usecases/Service/getservices.dart';
import 'package:infinity_bank/domain/Usecases/Service/updateservice.dart';
import 'package:infinity_bank/domain/Usecases/Service/uploadserviceicon.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/serviceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/servicestate.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final CreateServiceUseCase createServiceUseCase;
  final GetServicesUseCase getServicesUseCase;
  final UpdateServiceUseCase updateServiceUseCase;
  final DeleteServiceUseCase deleteServiceUseCase;
  final UploadServiceIconUseCase uploadServiceIconUseCase;

  ServiceBloc({
    required ServiceRepository repository,
  })  : createServiceUseCase = CreateServiceUseCase(repository),
        getServicesUseCase = GetServicesUseCase(repository),
        updateServiceUseCase = UpdateServiceUseCase(repository),
        deleteServiceUseCase = DeleteServiceUseCase(repository),
        uploadServiceIconUseCase = UploadServiceIconUseCase(repository),
        super(ServiceInitial()) {
    on<GetServicesEvent>(_onGetServicesEvent);
    on<CreateServiceEvent>(_onCreateServiceEvent);
    on<UpdateServiceEvent>(_onUpdateServiceEvent);
    on<DeleteServiceEvent>(_onDeleteServiceEvent);
    on<UploadServiceIconEvent>(_onUploadServiceIconEvent);
  }

  Future<void> _onGetServicesEvent(
      GetServicesEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      final services = await getServicesUseCase.call();
      emit(ServicesLoaded(services));
    } catch (e) {
      emit(ServiceError("Error obtaining services: $e"));
    }
  }

  Future<void> _onCreateServiceEvent(
      CreateServiceEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      final errorMessage = await createServiceUseCase.call(event.service);
      if (errorMessage == null) {
        emit(ServiceCreated(event.service));
      } else {
        emit(ServiceError(errorMessage));
      }
    } catch (e) {
      emit(ServiceError("Error creating service: $e"));
    }
  }

  Future<void> _onUpdateServiceEvent(
      UpdateServiceEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      final errorMessage = await updateServiceUseCase.call(event.id, event.service);
      if (errorMessage == null) {
        emit(ServiceUpdated());
        final services = await getServicesUseCase.call();
        emit(ServicesLoaded(services));
      } else {
        emit(ServiceError(errorMessage));
      }
    } catch (e) {
      emit(ServiceError("Error updating service: $e"));
    }
  }

  Future<void> _onDeleteServiceEvent(
      DeleteServiceEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      final errorMessage = await deleteServiceUseCase.call(event.id);
      if (errorMessage == null) {
        emit(ServiceDeleted());
        final services = await getServicesUseCase.call();
        emit(ServicesLoaded(services));
      } else {
        emit(ServiceError(errorMessage));
      }
    } catch (e) {
      emit(ServiceError("Error deleting service: $e"));
    }
  }

  Future<void> _onUploadServiceIconEvent(
      UploadServiceIconEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      final errorMessage = await uploadServiceIconUseCase.call(event.id, event.filePath);
      if (errorMessage == null) {
        emit(ServiceIconUploaded());
      } else {
        emit(ServiceError(errorMessage));
      }
    } catch (e) {
      emit(ServiceError("Error uploading service icon: $e"));
    }
  }
}
