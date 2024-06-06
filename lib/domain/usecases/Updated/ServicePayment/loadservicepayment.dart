import 'package:infinity_bank/domain/models/Updated/ServicePayment/servicepaymentModel.dart';

class LoadServicePaymentData {
  Future<ServicePayment> call() async {
    return ServicePayment(
      id: 1,
      accountId: 1,
      serviceId: 1,
      amount: 100.00,
      paymentDate: DateTime.now(),
      description: "Electricity bill payment",
    );
  }
}
