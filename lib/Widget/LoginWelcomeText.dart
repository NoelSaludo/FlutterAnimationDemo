import 'package:flutter/material.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome Back',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}

