import 'package:infinity_bank/domain/ApiProvider/Service/serviceProvider.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceProvider _provider;

  ServiceRepositoryImpl(this._provider);

  @override
  Future<Service> createService(Service service) async {
    try {
      final createdService = await _provider.createService(service.toJson());
      return createdService;
    } catch (e) {
      throw Exception("Failed to create service: $e");
    }
  }

  @override
  Future<List<Service>> getServices() async {
    try {
      final services = await _provider.getServices();
      return services;
    } catch (e) {
      throw Exception("Failed to get services: $e");
    }
  }

  @override
  Future<Service> getService(int id) async {
    try {
      final service = await _provider.getService(id);
      return service;
    } catch (e) {
      throw Exception("Failed to get service: $e");
    }
  }

  @override
  Future<bool> updateService(int id, Service service) async {
    try {
      await _provider.updateService(id, service.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteService(int id) async {
    try {
      await _provider.deleteService(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> uploadServiceIcon(int id, String filePath) async {
    try {
      await _provider.uploadServiceIcon(id, filePath);
    } catch (e) {
      throw Exception("Failed to upload service icon: $e");
    }
  }
}
