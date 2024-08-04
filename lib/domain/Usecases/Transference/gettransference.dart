import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';
import 'package:infinity_bank/domain/Repository/Transference/transference_repository.dart';

class GetTransferenceUseCase {
  final TransferenceRepository repository;

  GetTransferenceUseCase(this.repository);

  Future<Transference> call(int id) async {
    try {
      return await repository.getTransference(id);
    } catch (e) {
      throw Exception("Error al obtener la transferencia: $e");
    }
  }
}
