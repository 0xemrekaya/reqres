import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/screens/home/view/home_view.dart';
import 'package:reqres/screens/splash/splash_view.dart';
import 'package:reqres/theme/custom_theme.dart';
import 'screens/login/login.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.themeLight,
        routes: {
          HomeView.id: (context) => const HomeView(),
          LoginView.id: (context) => LoginView(),
          SplashView.id: (context) => const SplashView(),
        },
        home: const SplashView());
  }
}
