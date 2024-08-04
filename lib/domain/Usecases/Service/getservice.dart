import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';
import 'package:infinity_bank/domain/Usecases/Service/servicevalidator.dart';

class GetServiceUseCase {
  final ServiceRepository repository;

  GetServiceUseCase(this.repository);

  Future<Service> call(int id) async {
    final service = await repository.getService(id);

    if (ServiceValidator.validate(service) != null) {
      throw Exception("Invalid service data");
    }

    return service;
  }
}
