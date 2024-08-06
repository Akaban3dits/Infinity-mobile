import 'package:infinity_bank/domain/ApiProvider/Service/serviceProvider.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceProvider _provider;

  ServiceRepositoryImpl(this._provider);

  @override
  Future<List<Service>> getServices() async {
    try {
      final services = await _provider.getServices();
      return services;
    } catch (e) {
      throw Exception("Failed to get services: $e");
    }
  }
}
