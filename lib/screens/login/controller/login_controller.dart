import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reqres/screens/home/view/home_view.dart';
import '../../../core/core.dart';
import '../model/model.dart';
import '../service/service.dart';

class LoginController with CacheManager {
  late LoginService loginService;
  final _baseUrl = 'https://reqres.in';

  LoginController(this.context) {
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    loginService = LoginService(dio);
  }
  final BuildContext context;

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService.fetchLogin(UserRequestModel(email: email, password: password));
    if (response != null) {
      saveToken(response.token ?? '');
      navigateToHome();
    }
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomeView.id);
  }
}
