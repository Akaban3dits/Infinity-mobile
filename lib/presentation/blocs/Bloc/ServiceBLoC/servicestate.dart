import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object?> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServicesLoaded extends ServiceState {
  final List<Service> services;

  const ServicesLoaded(this.services);

  @override
  List<Object?> get props => [services];
}

class ServiceCreated extends ServiceState {
  final Service service;

  const ServiceCreated(this.service);

  @override
  List<Object?> get props => [service];
}

class ServiceUpdated extends ServiceState {}

class ServiceDeleted extends ServiceState {}

class ServiceIconUploaded extends ServiceState {}

class ServiceError extends ServiceState {
  final String message;

  const ServiceError(this.message);

  @override
  List<Object?> get props => [message];
}
