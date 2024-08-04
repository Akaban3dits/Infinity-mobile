import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';

class GetServicesUseCase {
  final ServiceRepository repository;

  GetServicesUseCase(this.repository);

  Future<List<Service>> call() async {
    return await repository.getServices();
  }
}
