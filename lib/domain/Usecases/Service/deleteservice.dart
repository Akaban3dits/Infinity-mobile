import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';

class DeleteServiceUseCase {
  final ServiceRepository repository;

  DeleteServiceUseCase(this.repository);

  Future<String?> call(int id) async {
    try {
      await repository.deleteService(id);
    } catch (e) {
      return 'Error al eliminar el servicio: $e';
    }
    return null;
  }
}
