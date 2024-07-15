import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/usecases/Updated/Customer/loadcustomer.dart'
    as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_event.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/api_provider.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final usecase.LoadCustomerData loadCustomerData;
  final ApiProvider apiProvider;

  CustomerBloc(this.loadCustomerData, this.apiProvider)
      : super(const CustomerState()) {
    on<FirstNameChanged>((event, emit) {
      emit(state.copyWith(firstName: event.firstName));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RFCChanged>((event, emit) {
      emit(state.copyWith(rfc: event.rfc));
    });

    on<PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });

    on<LoadUserDataEvent>((event, emit) async {
      emit(CustomerLoading());
      try {
        final userData = await apiProvider.getUserData();
        emit(CustomerState.fromJson(userData));
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(CustomerLoading());
      try {
        await apiProvider.registerUser(event.userData);
        emit(CustomerRegistered());
      } on DioException catch (e) {
        if (e.response?.statusCode == 400) {
          emit(CustomerError("Bad Request: ${e.response?.data}"));
        } else {
          emit(CustomerError("Error: ${e.message}"));
        }
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(CustomerLoading());
      try {
        await apiProvider.updateUser(event.userData);
        emit(UserUpdated());
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          emit(const CustomerError("Unauthorized. Please log in again."));
        } else if (e.response?.statusCode == 400) {
          emit(CustomerError("Bad Request: ${e.response?.data}"));
        } else {
          emit(CustomerError("Error: ${e.message}"));
        }
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });
  }
}
