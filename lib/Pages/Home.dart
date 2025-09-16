import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';
import 'package:flutteranimationdemo/Pages/LoginPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonBuilder buttonBuilder = ButtonBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: buttonBuilder.BuildTextButtonToPage(
          context,
          LoginPage(),
          Text("Go to Login Page"),
        ),
      ),
    );
  }

}
