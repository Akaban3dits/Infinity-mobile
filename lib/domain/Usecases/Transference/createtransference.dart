import 'package:infinity_bank/domain/Repository/Transference/transference_repository.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';
import 'package:infinity_bank/domain/Usecases/Transference/transferencevalidator.dart';

class CreateTransferenceUseCase {
  final TransferenceRepository repository;

  CreateTransferenceUseCase(this.repository);

  Future<String?> call(Transference transference) async {
    final errorMessage = TransferenceValidator.validate(transference);
    if (errorMessage != null) {
      return errorMessage;
    }
    try {
      await repository.createTransference(transference);
    } catch (e) {
      return 'Error al crear la transferencia: $e';
    }
    return null;
  }
}
