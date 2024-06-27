import 'package:infinity_bank/domain/usecases/Updated/Customer/loadcustomer.dart'
    as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final usecase.LoadCustomerData loadCustomerData;
  CustomerBloc(this.loadCustomerData) : super(const CustomerState()) {
    on<LoadCustomerDataEvent>((event, emit) async {
      final customerData = await loadCustomerData();
      emit(CustomerState.fromModel(customerData));
    });
  }
}
