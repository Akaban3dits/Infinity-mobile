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

// ignore: non_constant_identifier_names
List<CardName> CardList = [
  CardName(
      money: 150.00,
      account: '0129',
      name: 'Rosario Joahan',
      vig: 12,
      vig1: 23),
  CardName(
      money: 1700.00,
      account: '5412',
      name: 'Rosario Joahan',
      vig: 12,
      vig1: 29)
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
      url:
          "https://i.pinimg.com/564x/93/ce/ee/93ceee632193783ee0cbd66dc1eedb2a.jpg"),
  MovementsBank(
      usuario: 'Beto Fuentes',
      monto: 50.00,
      fecha: DateTime(2024, 4, 2),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro en ATM',
      id: '002',
      url:
          "https://i.pinimg.com/736x/84/7b/83/847b830fbe4c00b39351645e6c114de4.jpg"),
  MovementsBank(
      usuario: 'Mau Molina',
      monto: 23.90,
      fecha: DateTime(2024, 3, 31),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de Servicio de Internet',
      id: '003',
      url:
          "https://i.pinimg.com/564x/5a/ac/f1/5aacf15c6435bff2bca3bcbbda69359e.jpg"),
  MovementsBank(
      usuario: 'Carlos Vega',
      monto: 120.00,
      fecha: DateTime(2024, 4, 5),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito por transferencia',
      id: '004',
      url:
          "https://i.pinimg.com/564x/e7/d1/c7/e7d1c794e3ec17175566b87b535e93bf.jpg"),
  MovementsBank(
      usuario: 'Ana López',
      monto: 75.00,
      fecha: DateTime(2024, 4, 6),
      tipo: 'Retiro',
      estado: 'Pendiente',
      detalle: 'Retiro en ventanilla',
      id: '005',
      url:
          "https://i.pinimg.com/564x/32/8c/61/328c61b99f00a014b32e82f4db581ec6.jpg"),
  MovementsBank(
      usuario: 'Ricardo Gómez',
      monto: 45.50,
      fecha: DateTime(2024, 4, 3),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de tarjeta de crédito',
      id: '006',
      url:
          "https://i.pinimg.com/564x/30/7f/aa/307faa9f45caf0865e53079a87d6a3a7.jpg"),
  MovementsBank(
      usuario: 'Sofía Marín',
      monto: 200.00,
      fecha: DateTime(2024, 4, 7),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito cheque',
      id: '007',
      url:
          "https://i.pinimg.com/564x/56/58/60/5658605b395f469acd597b87e4eebbb8.jpg"),
  MovementsBank(
      usuario: 'Omar Sánchez',
      monto: 33.25,
      fecha: DateTime(2024, 4, 8),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de servicios',
      id: '008',
      url:
          "https://i.pinimg.com/736x/ba/e3/6c/bae36c081ed38a98aea93baffc776063.jpg"),
  MovementsBank(
      usuario: 'Luisa Fernanda',
      monto: 130.00,
      fecha: DateTime(2024, 4, 10),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito directo de nómina',
      id: '009',
      url:
          "https://i.pinimg.com/736x/a9/ab/db/a9abdb0abd7a27d8da8169f2701940ef.jpg"),
  MovementsBank(
      usuario: 'Jorge Castillo',
      monto: 60.00,
      fecha: DateTime(2024, 4, 12),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro en ATM',
      id: '010',
      url:
          "https://i.pinimg.com/736x/de/c1/68/dec1684bd05d69d4248e5b684211f408.jpg"),
  MovementsBank(
      usuario: 'Patricia Solis',
      monto: 39.95,
      fecha: DateTime(2024, 4, 13),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de factura de teléfono',
      id: '011',
      url:
          "https://i.pinimg.com/564x/0c/ff/27/0cff27f446b525bcb087d72523dd4f09.jpg"),
  MovementsBank(
      usuario: 'Ernesto Varela',
      monto: 150.00,
      fecha: DateTime(2024, 4, 11),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito móvil',
      id: '012',
      url:
          "https://i.pinimg.com/736x/1b/1e/c8/1b1ec8971123a08d781f424799fe9af9.jpg"),
  MovementsBank(
      usuario: 'Diana Reyes',
      monto: 80.00,
      fecha: DateTime(2024, 4, 15),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro en sucursal',
      id: '013',
      url:
          "https://i.pinimg.com/564x/a8/f0/22/a8f0223a6b85d87ed4dbb11d63b5ab83.jpg"),
  MovementsBank(
      usuario: 'Marco Antonio',
      monto: 100.00,
      fecha: DateTime(2024, 4, 16),
      tipo: 'Depósito',
      estado: 'Pendiente',
      detalle: 'Depósito de cheque',
      id: '014',
      url:
          "https://i.pinimg.com/564x/ce/6f/9a/ce6f9a546e233bfb81f4d09d0c12bdd0.jpg"),
  MovementsBank(
      usuario: 'Claudia Espinoza',
      monto: 55.00,
      fecha: DateTime(2024, 4, 17),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro por cajero automático',
      id: '015',
      url:
          "https://i.pinimg.com/564x/dc/ad/f7/dcadf75b8737c1d440d9e5827b040e8b.jpg"),
  MovementsBank(
      usuario: 'Esteban Quiroz',
      monto: 22.75,
      fecha: DateTime(2024, 4, 14),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de luz',
      id: '016',
      url:
          "https://i.pinimg.com/564x/55/39/ae/5539aefb9388972682c40be07fb4ce7c.jpg"),
  MovementsBank(
      usuario: 'Laura Montes',
      monto: 175.00,
      fecha: DateTime(2024, 4, 18),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito de amigo',
      id: '017',
      url:
          "https://i.pinimg.com/564x/4b/61/c9/4b61c904bedc5ea9ebb5e5629e014b2a.jpg"),
  MovementsBank(
      usuario: 'Rafael Jiménez',
      monto: 48.20,
      fecha: DateTime(2024, 4, 19),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de cable',
      id: '018',
      url:
          "https://i.pinimg.com/736x/ba/e3/6c/bae36c081ed38a98aea93baffc776063.jpg"),
];

List<MovementsBank> list1 = [
  MovementsBank(
      usuario: 'Carlos Vega',
      monto: 120.00,
      fecha: DateTime(2024, 4, 5),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito por transferencia',
      id: '004',
      url:
          "https://i.pinimg.com/564x/e7/d1/c7/e7d1c794e3ec17175566b87b535e93bf.jpg"),
  MovementsBank(
      usuario: 'Ana López',
      monto: 75.00,
      fecha: DateTime(2024, 4, 6),
      tipo: 'Retiro',
      estado: 'Pendiente',
      detalle: 'Retiro en ventanilla',
      id: '005',
      url:
          "https://i.pinimg.com/564x/32/8c/61/328c61b99f00a014b32e82f4db581ec6.jpg"),
  MovementsBank(
      usuario: 'Ricardo Gómez',
      monto: 45.50,
      fecha: DateTime(2024, 4, 3),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de tarjeta de crédito',
      id: '006',
      url:
          "https://i.pinimg.com/564x/30/7f/aa/307faa9f45caf0865e53079a87d6a3a7.jpg"),
  MovementsBank(
      usuario: 'Sofía Marín',
      monto: 200.00,
      fecha: DateTime(2024, 4, 7),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito cheque',
      id: '007',
      url:
          "https://i.pinimg.com/564x/56/58/60/5658605b395f469acd597b87e4eebbb8.jpg"),
  MovementsBank(
      usuario: 'Omar Sánchez',
      monto: 33.25,
      fecha: DateTime(2024, 4, 8),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de servicios',
      id: '008',
      url:
          "https://i.pinimg.com/736x/ba/e3/6c/bae36c081ed38a98aea93baffc776063.jpg"),
];

List<MovementsBank> list2 = [
  MovementsBank(
      usuario: 'Luisa Fernanda',
      monto: 130.00,
      fecha: DateTime(2024, 4, 10),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito directo de nómina',
      id: '009',
      url:
          "https://i.pinimg.com/736x/a9/ab/db/a9abdb0abd7a27d8da8169f2701940ef.jpg"),
  MovementsBank(
      usuario: 'Jorge Castillo',
      monto: 60.00,
      fecha: DateTime(2024, 4, 12),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro en ATM',
      id: '010',
      url: ""),
  MovementsBank(
      usuario: 'Patricia Solis',
      monto: 39.95,
      fecha: DateTime(2024, 4, 13),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de factura de teléfono',
      id: '011',
      url:
          "https://i.pinimg.com/564x/0c/ff/27/0cff27f446b525bcb087d72523dd4f09.jpg"),
  MovementsBank(
      usuario: 'Ernesto Varela',
      monto: 150.00,
      fecha: DateTime(2024, 4, 11),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito móvil',
      id: '012',
      url:
          "https://i.pinimg.com/736x/1b/1e/c8/1b1ec8971123a08d781f424799fe9af9.jpg"),
  MovementsBank(
      usuario: 'Diana Reyes',
      monto: 80.00,
      fecha: DateTime(2024, 4, 15),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro en sucursal',
      id: '013',
      url:
          "https://i.pinimg.com/564x/a8/f0/22/a8f0223a6b85d87ed4dbb11d63b5ab83.jpg"),
];

List<MovementsBank> list3 = [
  MovementsBank(
      usuario: 'Marco Antonio',
      monto: 100.00,
      fecha: DateTime(2024, 4, 16),
      tipo: 'Depósito',
      estado: 'Pendiente',
      detalle: 'Depósito de cheque',
      id: '014',
      url:
          "https://i.pinimg.com/564x/ce/6f/9a/ce6f9a546e233bfb81f4d09d0c12bdd0.jpg"),
  MovementsBank(
      usuario: 'Claudia Espinoza',
      monto: 55.00,
      fecha: DateTime(2024, 4, 17),
      tipo: 'Retiro',
      estado: 'Completado',
      detalle: 'Retiro por cajero automático',
      id: '015',
      url:
          "https://i.pinimg.com/564x/dc/ad/f7/dcadf75b8737c1d440d9e5827b040e8b.jpg"),
  MovementsBank(
      usuario: 'Esteban Quiroz',
      monto: 22.75,
      fecha: DateTime(2024, 4, 14),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de luz',
      id: '016',
      url:
          "https://i.pinimg.com/564x/55/39/ae/5539aefb9388972682c40be07fb4ce7c.jpg"),
  MovementsBank(
      usuario: 'Laura Montes',
      monto: 175.00,
      fecha: DateTime(2024, 4, 18),
      tipo: 'Depósito',
      estado: 'Completado',
      detalle: 'Depósito de amigo',
      id: '017',
      url:
          "https://i.pinimg.com/564x/4b/61/c9/4b61c904bedc5ea9ebb5e5629e014b2a.jpg"),
  MovementsBank(
      usuario: 'Rafael Jiménez',
      monto: 48.20,
      fecha: DateTime(2024, 4, 19),
      tipo: 'Pago',
      estado: 'Completado',
      detalle: 'Pago de cable',
      id: '018',
      url:
          "https://i.pinimg.com/736x/ba/e3/6c/bae36c081ed38a98aea93baffc776063.jpg"),
];
