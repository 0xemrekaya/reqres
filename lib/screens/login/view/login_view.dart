import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  static const String id = 'login_view';
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final String emailText = 'Email';
  final String paswordText = 'Password';
  final String buttonText = 'Login';
  LoginController? loginConttroller;

  @override
  Widget build(BuildContext context) {
    loginConttroller = LoginController(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 10, vertical: height / 10),
        child: Center(
            child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Wrap(
                  runSpacing: height / 50,
                  alignment: WrapAlignment.center,
                  children: [
                    Text('Login', style: textStyle.headlineMedium),
                    TextFormField(
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value != null && EmailValidator.validate(value) ? null : 'Please enter a valid email',
                        decoration: InputDecoration(labelText: emailText, border: const OutlineInputBorder())),
                    TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: paswordText,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the password field';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          loginConttroller!.fetchUserLogin(controllerEmail.text, controllerPassword.text);
                        }
                      },
                      child: const Icon(Icons.login),
                    ),
                  ],
                ))),
      ),
    ));
  }
}
