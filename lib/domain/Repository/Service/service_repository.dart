import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices();
}
