import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';
import 'package:flutteranimationdemo/Pages/LoadingPage.dart';

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
    MyHomePage mhp = MyHomePage(title: "Home Page");
    LoadingPage lp = LoadingPage(PageToLoad: mhp);

    // Loading page will navigate to Home page after loading
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => lp),
    );
  }
}
