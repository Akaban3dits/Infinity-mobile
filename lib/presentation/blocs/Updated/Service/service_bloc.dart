import 'package:infinity_bank/domain/usecases/Updated/Service/loadservice.data.dart' as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/Service/service_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Service/service_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final usecase.LoadServiceData loadServiceData;
  ServiceBloc(this.loadServiceData)
      : super(const ServiceState()) {
    on<LoadServiceDataEvent>((event, emit) async {
      final serviceData = await loadServiceData();
      emit(ServiceState.fromModel(serviceData));
    });
  }
}
