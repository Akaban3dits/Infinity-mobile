import 'package:infinity_bank/domain/models/movements/movementsModel.dart';
import 'package:infinity_bank/domain/repositories/movements/movements_repository.dart';

class LoadMovementData {
  final MovementsRepository repository;

  LoadMovementData(this.repository);

  Future<movementsModel> call() async {
    final movementData = await repository.loadMovementsData();

    if (movementData.usuario.isEmpty) {
      throw Exception("Usuario cannot be empty");
    }
    if (movementData.monto.isNaN || movementData.monto.isNegative) {
      throw Exception("Monto cannot be empty or negative");
    }
    if (movementData.fecha.isEmpty) {
      throw Exception("Fecha cannot be empty");
    }
    if (movementData.tipo.isEmpty) {
      throw Exception("Tipo cannot be empty");
    }
    if (movementData.estado.isEmpty) {
      throw Exception("Estado cannot be empty");
    }
    if (movementData.detalle.isEmpty) {
      throw Exception("Detalle cannot be empty");
    }
    if (movementData.id.isEmpty) {
      throw Exception("ID cannot be empty");
    }
    if (movementData.url.isEmpty) {
      throw Exception("URL cannot be empty");
    }

    return movementData;
  }
}