import 'package:infinity_bank/domain/models/people/peopleModel.dart';
import 'package:infinity_bank/domain/repositories/people/people_repository.dart';


class LoadPeopleData {
  final PeopleRepository repository;

  LoadPeopleData(this.repository);

  Future<UsuarioModel> call() async {
    final peopleData = await repository.loadPeopleData();

    if (peopleData.nombre.isEmpty) {
      throw Exception("Nombre cannot be empty");
    }
    if (peopleData.numeroDeCuenta <= 0) {
      throw Exception("Numero de Cuenta must be a positive integer");
    }
    if (peopleData.url.isEmpty) {
      throw Exception("URL cannot be empty");
    }

    return peopleData;
  }
}
