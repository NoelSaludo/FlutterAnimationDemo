import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/utils/PageNavigator.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final double size = 200.0;

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
        Text(
          'BookShelf',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(97, 93, 237, 1.0),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 16.0,
          )
        ),
        Container(
          padding: const EdgeInsets.only(right: 25.0), // Adds 20 logical pixels of padding to the left
          child: Lottie.asset("assets/login.json", width: size, height: size),
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[50],//textfield background color
            labelText: 'Username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Customize border radius
              borderSide: BorderSide(
                color: Colors.blue, // Customize border color
                width: 2.0, // Customize border width
              ),
            ),
          ),
          controller: usernameController,
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            filled: true,
            fillColor: Colors.grey[50], //textfield background color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Customize border radius
              borderSide: BorderSide(
                color: Colors.blue, // Customize border color
                width: 2.0, // Customize border width
              ),
            ),
),
          obscureText: true,
          controller: passwordController,
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () => {handleLogin(context)},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(97, 93, 237, 1.0),
            foregroundColor: Colors.white,
            minimumSize: const Size(200, 50),
            // Additional styling like shape, elevation, etc. can also be added here
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
    ),
  ),
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
