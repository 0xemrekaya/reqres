import 'package:dio/dio.dart';
import '../../../core/core.dart';
import '../model/model.dart';
import '../service/service.dart';

class LoginController with CacheManager {
  late LoginService loginService;
  final _baseUrl = 'https://reqres.in';

  LoginController() {
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService.fetchLogin(UserRequestModel(email: email, password: password));
    if (response != null) {
      saveToken(response.token ?? '');
    }
  }
}
