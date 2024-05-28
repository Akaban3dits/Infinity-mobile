import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/movements/movementsModel.dart';
import 'package:infinity_bank/domain/repositories/movements/movements_repository.dart';

class MovementsRepositoryImpl implements MovementsRepository {
  @override
  Future<movementsModel> loadMovementsData() async {
    final response = await rootBundle.loadString('assets/json/movements.json');
    final data = json.decode(response);
    return movementsModel.fromJson(data);
  }
}
