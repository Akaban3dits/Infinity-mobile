import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

class TransferenceValidator {
  static String? validate(Transference transference) {
    // Validar número de cuenta del receptor
    if (transference.receptorAccount.isEmpty ||
        transference.receptorAccount.length != 12 ||
        !RegExp(r'^\d{12}$').hasMatch(transference.receptorAccount)) {
      return 'Número de cuenta del receptor inválido. Debe tener exactamente 12 dígitos.';
    }
    
    // Validar cantidad
    if (transference.amount <= 50) {
      return 'La cantidad debe ser mayor que 50.';
    }
    
    // Validar concepto
    if (transference.concept.isEmpty ||
        transference.concept.length < 6 ||
        transference.concept.length > 35) {
      return 'El concepto debe tener entre 6 y 35 caracteres.';
    }

    return null;
  }
}
