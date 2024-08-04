import 'package:dio/dio.dart';
import 'package:infinity_bank/presentation/blocs/secure_storage_service.dart';

class ApiClient {
  late final Dio _dio;
  final SecureStorageService _secureStorageService = SecureStorageService();

  ApiClient._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: "https://apimoviles-production.up.railway.app",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30)));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _secureStorageService.readToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    ));
  }

  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  Dio get dio => _dio;
}
