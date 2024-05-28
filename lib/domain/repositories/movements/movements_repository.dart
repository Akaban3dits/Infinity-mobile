import 'package:infinity_bank/domain/models/movements/movementsModel.dart';

abstract class MovementsRepository {
  Future<movementsModel> loadMovementsData();
}
