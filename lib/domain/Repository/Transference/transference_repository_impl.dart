import 'package:infinity_bank/domain/ApiProvider/Transference/transferenceProvider.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';
import 'package:infinity_bank/domain/Repository/Transference/transference_repository.dart';

class TransferenceRepositoryImpl implements TransferenceRepository {
  final TransferenceProvider _provider;

  TransferenceRepositoryImpl(this._provider);

  @override
  Future<Transference> createTransference(Transference transference) async {
    try {
      final createdTransference = await _provider.createTransference(transference.toPostJson());
      return createdTransference;
    } catch (e) {
      throw Exception("Failed to create transference: $e");
    }
  }

  @override
  Future<List<Transference>> getTransferences() async {
    try {
      final transferences = await _provider.getTransferences();
      return transferences;
    } catch ( e) {
      throw Exception("Failed to get transferences: $e");
    }
  }
}
