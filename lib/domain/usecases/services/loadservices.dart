import 'package:infinity_bank/domain/models/services/servicesModel.dart';

class Loadservicesdata {
  String servname = "Service Example";
  String url = "http://example.com/service";
  int tip_s = 1;

  Future<ServicesModel> call() async {
    return ServicesModel(
      servname: servname,
      url: url,
      tip_s: tip_s,
    );
  }
}
