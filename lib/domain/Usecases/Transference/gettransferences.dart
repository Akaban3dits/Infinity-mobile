import 'package:infinity_bank/domain/Repository/Transference/transference_repository.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

class GetTransferencesUseCase {
  final TransferenceRepository repository;

  GetTransferencesUseCase(this.repository);

  Future<List<Transference>> call() async {
    try {
      final transferences = await repository.getTransferences();
      return transferences;
    } catch (e) {
      throw Exception("Error al obtener las transferencias: $e");
    }
  }
}
