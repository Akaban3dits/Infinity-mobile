import 'package:infinity_bank/domain/ApiProvider/AuthProvider/authprovider.dart';

class LoginUseCase {
  final AuthProvider _authProvider;

  LoginUseCase(this._authProvider);

  Future<bool> call(String phone, String password) async {
    try {
      final token = await _authProvider.login(phone, password);
      return token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
