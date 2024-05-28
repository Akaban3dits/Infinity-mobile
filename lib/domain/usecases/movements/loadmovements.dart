import 'package:infinity_bank/domain/models/movements/movementsModel.dart';

class Loadmovementsdata {
  String usuario = "UsuarioEjemplo";
  double monto = 1000.50;
  String fecha = 'Hola';
  String tipo = "Ingreso";
  String estado = "Completado";
  String detalle = "Detalle del movimiento";
  String id = "12345";
  String url = "http://ejemplo.com/movimiento";

  Future<movementsModel> call() async {
    return movementsModel(
      usuario: usuario,
      monto: monto,
      fecha: fecha,
      tipo: tipo,
      estado: estado,
      detalle: detalle,
      id: id,
      url: url,
    );
  }
}
