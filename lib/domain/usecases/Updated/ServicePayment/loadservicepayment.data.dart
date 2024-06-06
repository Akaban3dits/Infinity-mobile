import 'package:infinity_bank/domain/models/Updated/ServicePayment/servicepaymentModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/ServicePayment/servicepayment_repository.dart';

class LoadServicePaymentData {
  final ServicePaymentRepository repository;

  LoadServicePaymentData(this.repository);

  Future<ServicePayment> call() async {
    final servicePaymentData = await repository.loadServicePaymentData();

    if (servicePaymentData.amount.isNegative) {
      throw Exception("Amount cannot be negative");
    }
    if (servicePaymentData.description.isEmpty) {
      throw Exception("Description cannot be empty");
    }

    return servicePaymentData;
  }
}
