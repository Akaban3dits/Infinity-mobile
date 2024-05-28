import 'package:infinity_bank/domain/models/services/servicesModel.dart';

abstract class ServicesRepository {
  Future<ServicesModel> loadServicesData();
}
