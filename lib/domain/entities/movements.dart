class MovementsBank {
  String usuario;
  double monto; // Cambiado de String a double
  DateTime fecha; // Cambiado de String a DateTime
  String tipo;
  String estado;
  String detalle;
  String id;
  String url;

  MovementsBank(
      {required this.usuario,
      required this.monto,
      required this.fecha,
      required this.tipo,
      required this.estado,
      required this.detalle,
      required this.id,
      required this.url});
}

class CardName {
  double money;
  String name, account;
  int vig, vig1;
  CardName(
      {required this.money,
      required this.account,
      required this.name,
      required this.vig,
      required this.vig1});
}
