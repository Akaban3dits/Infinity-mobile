import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/movements/movementsModel.dart';

class MovementsState extends Equatable {
  final String usuario;
  final double monto;
  final String fecha;
  final String tipo;
  final String estado;
  final String detalle;
  final String id;
  final String url;

  MovementsState({
    this.usuario = '',
    this.monto = 0,
    this.fecha = '',
    this.tipo = '',
    this.estado = '',
    this.detalle = '',
    this.id = '',
    this.url = '',
  });

  MovementsState copyWith({
    String? usuario,
    double? monto,
    String? fecha,
    String? tipo,
    String? estado,
    String? detalle,
    String? id,
    String? url,
  }) {
    return MovementsState(
      usuario: usuario ?? this.usuario,
      monto: monto ?? this.monto,
      fecha: fecha ?? this.fecha,
      tipo: tipo ?? this.tipo,
      estado: estado ?? this.estado,
      detalle: detalle ?? this.detalle,
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props =>
      [usuario, monto, fecha, tipo, estado, detalle, id, url];

  factory MovementsState.fromModel(movementsModel model) {
    return MovementsState(
      usuario: model.usuario,
      monto: model.monto,
      fecha: model.fecha,
      tipo: model.tipo,
      estado: model.estado,
      detalle: model.detalle,
      id: model.id,
      url: model.url,
    );
  }
}

