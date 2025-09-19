import 'package:flutter/material.dart';

class LoginUsernameField extends StatelessWidget {
  final TextEditingController controller;
  const LoginUsernameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[50],
        labelText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller: controller,
    );
  }
}

