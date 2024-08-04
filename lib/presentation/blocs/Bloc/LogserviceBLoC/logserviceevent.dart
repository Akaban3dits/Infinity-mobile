import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';

abstract class LogServiceEvent extends Equatable {
  const LogServiceEvent();

  @override
  List<Object?> get props => [];
}

class GetLogServicesEvent extends LogServiceEvent {}

class CreateLogServiceEvent extends LogServiceEvent {
  final LogService logService;

  const CreateLogServiceEvent(this.logService);

  @override
  List<Object?> get props => [logService];
}

class GetLogServiceEvent extends LogServiceEvent {
  final int id;

  const GetLogServiceEvent(this.id);

  @override
  List<Object?> get props => [id];
}
