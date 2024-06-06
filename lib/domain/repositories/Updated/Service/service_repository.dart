import 'package:infinity_bank/domain/models/Updated/Service/serviceModel.dart';
abstract class ServiceRepository {
  Future<Service> loadServiceData();
}
