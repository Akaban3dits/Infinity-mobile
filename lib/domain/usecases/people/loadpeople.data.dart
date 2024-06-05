import 'package:infinity_bank/domain/models/people/peopleModel.dart';
import 'package:infinity_bank/domain/repositories/people/people_repository.dart';

class LoadPeopleData {
  final PeopleRepository repository;

  LoadPeopleData(this.repository);

  Future<UsuarioModel> call() async {
    final peopleData = await repository.loadPeopleData();

    if (peopleData.nombre.length > 3 ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(peopleData.nombre) ||
        peopleData.nombre.isEmpty) {
      throw Exception("Name cannot be empty and only letters");
    }
    if (peopleData.numeroDeCuenta == 16 ||
        !RegExp(r'^[0-9]+$').hasMatch(peopleData.numeroDeCuenta.toString())) {
      throw Exception("Account number must be a positive integer");
    }
    if (peopleData.url.isEmpty ||
        !Uri.tryParse(peopleData.url)!.hasAbsolutePath) {
      throw Exception("URL cannot be empty");
    }

    return peopleData;
  }
}
