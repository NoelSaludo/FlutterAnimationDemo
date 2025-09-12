import 'package:flutter/material.dart';

class PageNavigator {
  void goTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => page));
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}