import 'package:infinity_bank/domain/models/Updated/Service/serviceModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Service/service_repository.dart';

class LoadServiceData {
  final ServiceRepository repository;

  LoadServiceData(this.repository);

  Future<Service> call() async {
    final serviceData = await repository.loadServiceData();

    if (serviceData.serviceName.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(serviceData.serviceName)) {
      throw Exception("Service name cannot be empty or invalid");
    }
    if (serviceData.serviceDescription.isEmpty) {
      throw Exception("Service description cannot be empty");
    }

    return serviceData;
  }
}