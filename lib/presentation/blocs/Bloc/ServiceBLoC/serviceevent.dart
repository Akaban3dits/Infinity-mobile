import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object?> get props => [];
}

class GetServicesEvent extends ServiceEvent {}

class CreateServiceEvent extends ServiceEvent {
  final Service service;

  const CreateServiceEvent(this.service);

  @override
  List<Object?> get props => [service];
}

class UpdateServiceEvent extends ServiceEvent {
  final int id;
  final Service service;

  const UpdateServiceEvent(this.id, this.service);

  @override
  List<Object?> get props => [id, service];
}

class DeleteServiceEvent extends ServiceEvent {
  final int id;

  const DeleteServiceEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class UploadServiceIconEvent extends ServiceEvent {
  final int id;
  final String filePath;

  const UploadServiceIconEvent(this.id, this.filePath);

  @override
  List<Object?> get props => [id, filePath];
}
