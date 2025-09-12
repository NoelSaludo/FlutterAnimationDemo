import 'package:flutter/material.dart';

class PageNavigator {
  static void goTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => page));
  }
}