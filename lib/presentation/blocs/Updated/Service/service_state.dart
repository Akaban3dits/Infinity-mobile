import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/Service/serviceModel.dart';

class ServiceState extends Equatable {
  final int id;
  final String serviceName;
  final String serviceDescription;

  const ServiceState({
    this.id = 0,
    this.serviceName = '',
    this.serviceDescription = '',
  });

  ServiceState copyWith({
    int? id,
    String? serviceName,
    String? serviceDescription,
  }) {
    return ServiceState(
      id: id ?? this.id,
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
    );
  }

  @override
  List<Object> get props =>
      [id, serviceName, serviceDescription];

  factory ServiceState.fromModel(Service model) {
    return ServiceState(
      id: model.id,
      serviceName: model.serviceName,
      serviceDescription: model.serviceDescription,
    );
  }
}
