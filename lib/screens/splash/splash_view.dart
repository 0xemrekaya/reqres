import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/core.dart';
import '../home/home.dart';
import '../login/login.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  static const String id = 'splash_view';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  Future<void> authLogic() async {
    final readAuthManager = ref.read(authManagerProvider);
    final watchAuthManager = ref.watch(authManagerProvider);
    await readAuthManager.fetchUserLogin();
    if (watchAuthManager.isLogin) {
      Navigator.pushReplacementNamed(context, HomeView.id);
    } else {
      Navigator.pushReplacementNamed(context, LoginView.id);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      authLogic();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
