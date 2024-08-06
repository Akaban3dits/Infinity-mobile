import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';

abstract class TransferenceRepository {
  Future<Transference> createTransference(Transference transference);
  Future<List<Transference>> getTransferences();
}
