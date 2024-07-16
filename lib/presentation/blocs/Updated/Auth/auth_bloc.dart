import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/api_provider.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiProvider _apiProvider;

  AuthBloc(this._apiProvider) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await _apiProvider.loginUser(event.username, event.password);

      emit(AuthAuthenticated(token));
      NotificationService.showNotification('Login successful. Token: $token');
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      emit(AuthError(_mapStatusCodeToMessage(e.response?.statusCode)));
    } catch (e) {
      print('Unexpected error: $e');
      emit(const AuthError('An unexpected error occurred'));
    }
  }

  String _mapStatusCodeToMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input and try again.';
      case 401:
        return 'Unauthorized. Incorrect username or password.';
      case 403:
        return 'Forbidden. You do not have permission to access this resource.';
      case 404:
        return 'Not found. The requested resource could not be found.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 502:
        return 'Bad gateway. Received an invalid response from the server.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
