import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';
import 'package:infinity_bank/domain/Usecases/Service/getservices.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/serviceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/servicestate.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServicesUseCase getServicesUseCase;

  ServiceBloc({
    required ServiceRepository repository,
  })  : getServicesUseCase = GetServicesUseCase(repository),
        super(ServiceInitial()) {
    on<GetServicesEvent>(_onGetServicesEvent);
  }

  Future<void> _onGetServicesEvent(
      GetServicesEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      final services = await getServicesUseCase.call();
      emit(ServicesLoaded(services));
    } catch (e) {
      print('Error obtaining services: $e');
      emit(ServiceError("Error obtaining services: $e"));
    }
  }
}
