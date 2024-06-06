import 'package:infinity_bank/domain/models/Updated/Service/serviceModel.dart';

class LoadServiceData {
  Future<Service> call() async {
    return Service(
      id: 1,
      serviceName: "Electricity",
      serviceDescription: "Monthly electricity bill",
    );
  }
}
