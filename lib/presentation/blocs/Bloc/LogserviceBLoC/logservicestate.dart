import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

abstract class LogServiceState extends Equatable {
  const LogServiceState();

  @override
  List<Object?> get props => [];
}

class LogServiceInitial extends LogServiceState {}

class LogServiceLoading extends LogServiceState {}

class LogServicesLoaded extends LogServiceState {
  final List<LogService> logServices;

  const LogServicesLoaded(this.logServices);

  @override
  List<Object?> get props => [logServices];
}

class LogServiceLoaded extends LogServiceState {
  final LogService logService;

  const LogServiceLoaded(this.logService);

  @override
  List<Object?> get props => [logService];
}

class LogServiceCreated extends LogServiceState {
  final LogService logService;

  const LogServiceCreated(this.logService);

  @override
  List<Object?> get props => [logService];
}

class LogServiceError extends LogServiceState {
  final String message;

  const LogServiceError(this.message);

  @override
  List<Object?> get props => [message];
}
