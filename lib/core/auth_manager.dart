import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core.dart';

class AuthManager extends ChangeNotifier with CacheManager {
  AuthManager() {
    fetchUserLogin();
  }

  bool isLogin = false;
  String? token;
  Future<void> fetchUserLogin() async {
    final _token = await getToken();
    if (_token != null) {
      isLogin = true;
      token = _token;
      notifyListeners();
    }
  }

  Future<void> logoutUser() async {
    final isTrue = await removeToken();
    if (isTrue == null || isTrue == false) {
      print("Hata");
    }
    if (isTrue == true) {
      isLogin = false;
      token = null;
      notifyListeners();
    }
  }
}

final authManagerProvider = ChangeNotifierProvider<AuthManager>((ref) {
  return AuthManager();
});
