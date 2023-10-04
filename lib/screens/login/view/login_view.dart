import 'package:flutter/material.dart';

import '../controller/controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final String emailText = 'Login';
  final String paswordText = 'Password';
  final String buttonText = 'Login';
  LoginController loginConttroller = LoginController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 10, vertical: height / 10),
        child: Center(
            child: Form(
                child: Wrap(
          runSpacing: height / 50,
          alignment: WrapAlignment.center,
          children: [
            Text('Login', style: textStyle.headlineMedium),
            TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(labelText: emailText, border: const OutlineInputBorder())),
            TextFormField(
                controller: controllerPassword,
                decoration: InputDecoration(labelText: paswordText, border: const OutlineInputBorder())),
            FloatingActionButton(
              onPressed: () {
                loginConttroller.fetchUserLogin(controllerEmail.text, controllerPassword.text);
              },
              child: const Icon(Icons.login),
            ),
          ],
        ))),
      ),
    ));
  }
}
