



import 'package:flutter/material.dart';
import 'core.dart';
class AuthManager with CacheManager {
  BuildContext context;
  AuthManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}