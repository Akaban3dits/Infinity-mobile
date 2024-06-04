import 'package:infinity_bank/domain/models/services/servicesModel.dart';
import 'package:infinity_bank/domain/repositories/services/services_repository.dart';

class LoadServiceData {
  final ServicesRepository repository;

  LoadServiceData(this.repository);

  Future<ServicesModel> call() async {
    final serviceData = await repository.loadServicesData();

    if (serviceData.url.isEmpty) {
      throw Exception("URL cannot be empty");
    }
    if (serviceData.servname.isEmpty) {
      throw Exception("Service name cannot be empty");
    }
    if (serviceData.tip_s <= 0) {
      throw Exception("Tip_s must be a positive integer");
    }

    return serviceData;
  }
}