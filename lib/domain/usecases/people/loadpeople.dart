import 'package:infinity_bank/domain/models/people/peopleModel.dart';

class Loadpeopledata {
  String nombre = "John Doe";
  int numeroDeCuenta = 12345678;
  String url = "http://example.com/user";

  Future<UsuarioModel> call() async {
    return UsuarioModel(
      nombre: nombre,
      numeroDeCuenta: numeroDeCuenta,
      url: url,
    );
  }
}
