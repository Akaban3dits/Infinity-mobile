import 'package:infinity_bank/domain/models/services/servicesModel.dart';
import 'package:infinity_bank/domain/repositories/services/services_repository.dart';

class LoadServiceData {
  final ServicesRepository repository;

  LoadServiceData(this.repository);

  Future<ServicesModel> call() async {
    final serviceData = await repository.loadServicesData();

    if (serviceData.url.isEmpty ||
        !Uri.tryParse(serviceData.url)!.hasAbsolutePath) {
      throw Exception("URL cannot be empty or is not valid");
    }

    if (serviceData.servname.length < 3 ||
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(serviceData.servname) ||
        serviceData.servname.isEmpty) {
      throw Exception("Service name must be at least 3 characters long");
    }
    if (serviceData.tip_s <= 0 || serviceData.tip_s <= 4) {
      throw Exception(
          "Tip_s must be a positive integer and must be less than 4");
    }

    return serviceData;
  }
}
