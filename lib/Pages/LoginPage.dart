import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/LoginTitle.dart';
import 'package:flutteranimationdemo/Widget/LoginWelcomeText.dart';
import 'package:flutteranimationdemo/Widget/LoginLottieAnimation.dart';
import 'package:flutteranimationdemo/Widget/LoginUsernameField.dart';
import 'package:flutteranimationdemo/Widget/LoginPasswordField.dart';
import 'package:flutteranimationdemo/Widget/LoginButton.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    // Handle your login logic here
    // For example, you might want to call an authentication service
    // and then navigate to another page on success
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(97, 93, 237, 1.0),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: _buildContent(context)),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LoginTitle(),
        const SizedBox(height: 10.0),
        const LoginWelcomeText(),
        const LoginLottieAnimation(),
        const SizedBox(height: 16.0),
        LoginUsernameField(controller: usernameController),
        const SizedBox(height: 16.0),
        LoginPasswordField(controller: passwordController),
        const SizedBox(height: 32.0),
        LoginButton(onPressed: () => handleLogin(context)),
      ],
    );
  }
}
