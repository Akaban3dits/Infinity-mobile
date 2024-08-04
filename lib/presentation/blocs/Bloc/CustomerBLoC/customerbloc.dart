import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Customer/customer_repository.dart';
import 'package:infinity_bank/domain/Usecases/Customer/create_customer.dart';
import 'package:infinity_bank/domain/Usecases/Customer/get_customer.dart';
import 'package:infinity_bank/domain/Usecases/Customer/update_customer.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerstate.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CreateCustomerUseCase createCustomerUseCase;
  final GetCustomerUseCase getCustomerUseCase;
  final UpdateCustomerUseCase updateCustomerUseCase;

  CustomerBloc({
    required CustomerRepository repository,
  })  : createCustomerUseCase = CreateCustomerUseCase(repository),
        getCustomerUseCase = GetCustomerUseCase(repository),
        updateCustomerUseCase = UpdateCustomerUseCase(repository),
        super(CustomerInitial()) {
    on<GetCustomerEvent>(_onGetCustomerEvent);
    on<CreateCustomerEvent>(_onCreateCustomerEvent);
    on<UpdateCustomerEvent>(_onUpdateCustomerEvent);

    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RFCChanged>(_onRFCChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
  }

  void _onFirstNameChanged(FirstNameChanged event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final updatedCustomer = (state as CustomerLoaded)
          .customer
          .copyWith(firstName: event.firstName);
      emit(CustomerLoaded(updatedCustomer));
    }
  }

  void _onLastNameChanged(LastNameChanged event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final updatedCustomer = (state as CustomerLoaded)
          .customer
          .copyWith(lastName: event.lastName);
      emit(CustomerLoaded(updatedCustomer));
    }
  }

  void _onEmailChanged(EmailChanged event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final updatedCustomer = (state as CustomerLoaded)
          .customer
          .copyWith(email: event.email);
      emit(CustomerLoaded(updatedCustomer));
    }
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final updatedCustomer = (state as CustomerLoaded)
          .customer
          .copyWith(password: event.password);
      emit(CustomerLoaded(updatedCustomer));
    }
  }

  void _onRFCChanged(RFCChanged event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final updatedCustomer =
          (state as CustomerLoaded).customer.copyWith(rfc: event.rfc);
      emit(CustomerLoaded(updatedCustomer));
    }
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final updatedCustomer = (state as CustomerLoaded)
          .customer
          .copyWith(phoneNumber: event.phoneNumber);
      emit(CustomerLoaded(updatedCustomer));
    }
  }

  Future<void> _onGetCustomerEvent(
      GetCustomerEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final customer = await getCustomerUseCase.call();
      emit(CustomerLoaded(customer));
    } catch (e) {
      emit(CustomerError("Error obteniendo el cliente: $e"));
    }
  }

  Future<void> _onCreateCustomerEvent(
      CreateCustomerEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final errorMessage = await createCustomerUseCase.call(event.customer);
      if (errorMessage == null) {
        emit(CustomerCreated(event.customer));
      } else {
        emit(CustomerError(errorMessage));
      }
    } catch (e) {
      emit(CustomerError("Error creando el cliente: $e"));
    }
  }

  Future<void> _onUpdateCustomerEvent(
      UpdateCustomerEvent event, Emitter<CustomerState> emit) async {
    try {
      emit(CustomerLoading());
      final errorMessage = await updateCustomerUseCase.call(event.customer);
      if (errorMessage == null) {
        emit(CustomerUpdated());
        final customer = await getCustomerUseCase.call();
        emit(CustomerLoaded(customer));
      } else {
        emit(CustomerError(errorMessage));
      }
    } catch (e) {
      emit(CustomerError("Error actualizando el cliente: $e"));
    }
  }
}
