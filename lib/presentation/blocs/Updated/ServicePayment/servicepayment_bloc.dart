import 'package:infinity_bank/domain/usecases/Updated/ServicePayment/loadservicepayment.dart' as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/ServicePayment/servicepayment_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/ServicePayment/servicepayment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicePaymentBloc extends Bloc<ServicePaymentEvent, ServicePaymentState> {
  final usecase.LoadServicePaymentData loadServicePaymentData;
  ServicePaymentBloc(this.loadServicePaymentData)
      : super(const ServicePaymentState()) {
    on<LoadServicePaymentDataEvent>((event, emit) async {
      final servicePaymentData = await loadServicePaymentData();
      emit(ServicePaymentState.fromModel(servicePaymentData));
    });
  }
}
