import 'package:infinity_bank/domain/models/Updated/ServicePayment/servicepaymentModel.dart';

abstract class ServicePaymentRepository {
  Future<ServicePayment> loadServicePaymentData();
}
