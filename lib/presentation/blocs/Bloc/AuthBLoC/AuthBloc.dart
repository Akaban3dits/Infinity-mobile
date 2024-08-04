import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/ApiProvider/AuthProvider/authprovider.dart';
import 'package:infinity_bank/domain/Usecases/Auth/login_use_case.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AuthBLoC/AuthEvent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AuthBLoC/AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;

  AuthBloc({required this.authProvider}) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  Future<void> _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final loginUseCase = LoginUseCase(authProvider);
      final isSuccess = await loginUseCase(event.phone, event.password);
      if (isSuccess) {
        emit(AuthAuthenticated());
      } else {
        emit(const AuthError('Invalid phone or password'));
      }
    } catch (e) {
      emit(AuthError('Failed to login: ${e.toString()}'));
    }
  }

  Future<void> _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authProvider.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError('Failed to logout: ${e.toString()}'));
    }
  }
}
