import 'package:infinity_bank/domain/models/people/peopleModel.dart';

abstract class PeopleRepository {
  Future<UsuarioModel> loadPeopleData();
}
