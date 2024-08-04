import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';

abstract class ServiceRepository {
  Future<Service> createService(Service service);
  Future<List<Service>> getServices();
  Future<Service> getService(int id);
  Future<bool> updateService(int id, Service service);
  Future<bool> deleteService(int id);
  Future<void> uploadServiceIcon(int id, String filePath);
}
