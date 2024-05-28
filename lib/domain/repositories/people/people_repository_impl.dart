import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/models/people/peopleModel.dart';
import 'package:infinity_bank/domain/repositories/people/people_repository.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  @override
  Future<UsuarioModel> loadPeopleData() async {
    final response = await rootBundle.loadString(('assets/json/people.json'));
    final data = json.decode(response);
    return UsuarioModel.fromJson(data);
  }
}
