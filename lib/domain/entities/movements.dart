

class MovementsBank {
  String usuario;
  double monto; // Cambiado de String a double
  DateTime fecha; // Cambiado de String a DateTime
  String tipo;
  String estado;
  String detalle;
  String id;

  MovementsBank({
    required this.usuario,
    required this.monto,
    required this.fecha,
    required this.tipo,
    required this.estado,
    required this.detalle,
    required this.id,
  });
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

// ignore: non_constant_identifier_names
List<CardName> CardList = [
  CardName(money: 150.00, account: '0129', name: 'Rosario Joahan', vig: 12 , vig1: 23),
  CardName(money: 1700.00, account: '5412', name: 'Rosario Joahan', vig: 12, vig1: 29)
];

// ignore: non_constant_identifier_names
List<MovementsBank> MoveList = [
  MovementsBank(
    usuario: 'Yeimi Noemi',
    monto: 100.00,
    fecha: DateTime(2024, 4, 1),
    tipo: 'Depósito',
    estado: 'Completado',
    detalle: 'Depósito en efectivo',
    id: '001',
  ),
  MovementsBank(
    usuario: 'Beto Fuentes',
    monto: -50.00,
    fecha: DateTime(2024, 4, 2),
    tipo: 'Retiro',
    estado: 'Completado',
    detalle: 'Retiro en ATM',
    id: '002',
  ),
  MovementsBank(
    usuario: 'Mau Molina',
    monto: -23.90,
    fecha: DateTime(2024, 3, 31),
    tipo: 'Pago',
    estado: 'Completado',
    detalle: 'Pago de Servicio de Internet',
    id: '003',
  ),
];
