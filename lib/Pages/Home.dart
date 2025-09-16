import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/shared/ButtonBuilder.dart';
import 'package:flutteranimationdemo/shared/PageNavigator.dart';
import 'package:flutteranimationdemo/Pages/LoginPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  final bool isLoggedIn = false;

  static const String testUsername = "testuser";
  static const String testPassword = "password123";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonBuilder buttonBuilder = ButtonBuilder();
  LoginPage loginPage = LoginPage();

  @override
  void initState() {
    if (!widget.isLoggedIn) {
      PageNavigator().goTo(context,loginPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}