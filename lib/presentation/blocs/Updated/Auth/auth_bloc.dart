
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:dio/dio.dart';
import 'package:infinity_bank/presentation/blocs/secure_storage_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio _dio = Dio();
  final SecureStorageService _secureStorageService = SecureStorageService();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/auth/login',
        data: {
          'phone': event.username,
          'password': event.password,
        },
      );

      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        if (token != null && token is String) {
          await _secureStorageService.writeToken(token);
          emit(AuthAuthenticated(token));
          NotificationService.showNotification('Login successful. Token: $token');
        } else {
          emit(const AuthError('Invalid token received.'));
        }
      } else {
        emit(AuthError(_mapStatusCodeToMessage(response.statusCode)));
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
        emit(AuthError(_mapStatusCodeToMessage(e.response?.statusCode)));
      } else {
        emit(const AuthError('Failed to connect to the server. Please check your internet connection.'));
      }
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
