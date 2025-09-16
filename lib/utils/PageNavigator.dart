import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';

class PageNavigator {
  void goTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => page),
    );
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void goToHome(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: "MyLibrary")),
    );
  }
}
