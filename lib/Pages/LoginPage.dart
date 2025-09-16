import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/utils/PageNavigator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(child: _Padding16(_buildContent(context)));
  }

  Widget _Padding16(Widget child) {
    return Padding(padding: EdgeInsetsGeometry.all(16.0), child: child);
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
          controller: usernameController,
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          controller: passwordController,
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () => {handleLogin(context)},
          child: const Text("Login"),
        ),
      ],
    );
  }

  void handleLogin(BuildContext context) {
    if (usernameController.text == "testuser" &&
        passwordController.text == "password123") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successful")));

      PageNavigator().goToHome(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid Credentials")));
    }
  }
}
