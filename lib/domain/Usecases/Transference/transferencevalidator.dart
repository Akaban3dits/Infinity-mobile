import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

class TransferenceValidator {
  static String? validate(Transference transference) {

    if (transference.receptorAccount.isEmpty ||
        !RegExp(r'^\d+$').hasMatch(transference.receptorAccount)) {
      return 'Número de cuenta del receptor inválido. Solo se permiten números.';
    }
    if (transference.amount <= 0) {
      return 'La cantidad debe ser mayor que cero.';
    }
    if (transference.concept.isEmpty) {
      return 'El concepto no puede estar vacío.';
    }
    if (transference.owner.isEmpty) {
      return 'El nombre del propietario no puede estar vacío.';
    }
    return null;
  }
}
