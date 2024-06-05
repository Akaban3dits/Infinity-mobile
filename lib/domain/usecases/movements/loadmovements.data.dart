import 'package:infinity_bank/domain/models/movements/movementsModel.dart';
import 'package:infinity_bank/domain/repositories/movements/movements_repository.dart';

class LoadMovementData {
  final MovementsRepository repository;

  LoadMovementData(this.repository);

  Future<movementsModel> call() async {
    final movementData = await repository.loadMovementsData();

    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(movementData.usuario) ||
        movementData.usuario.isEmpty) {
      throw Exception("User cannot be empty");
    }
    if (movementData.monto.isNaN ||
        movementData.monto.isNegative ||
        movementData.monto > 50 && movementData.monto < 5000) {
      throw Exception("Monto cannot be empty or negative");
    }
    if (movementData.fecha.isEmpty || !_isValidDate(movementData.fecha)) {
      throw Exception("Fecha cannot be empty");
    }
    if (movementData.tipo.isEmpty ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(movementData.usuario)) {
      throw Exception("Tipo cannot be empty");
    }
    if (movementData.estado.isEmpty) {
      throw Exception("Estado cannot be empty");
    }
    if (movementData.detalle.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(movementData.usuario) ||
        movementData.detalle.length < 300) {
      throw Exception("Detalle cannot be empty");
    }
    if (movementData.id.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(movementData.usuario) ||
        movementData.id.length == 32) {
      throw Exception("UUID cannot be empty");
    }

    return movementData;
  }

  bool _isValidDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return date == parsedDate.toIso8601String().substring(0, 10);
    } catch (e) {
      return false;
    }
  }
}
