import 'package:infinity_bank/domain/Repository/Service/service_repository.dart';

class UploadServiceIconUseCase {
  final ServiceRepository repository;

  UploadServiceIconUseCase(this.repository);

  Future<String?> call(int id, String filePath) async {
    try {
      await repository.uploadServiceIcon(id, filePath);
    } catch (e) {
      return 'Error al subir el icono del servicio: $e';
    }
    return null;
  }
}
