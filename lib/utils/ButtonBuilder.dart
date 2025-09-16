import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/utils/PageNavigator.dart';

class ButtonBuilder {
  Widget BuildTextButtonToPage(BuildContext context, Widget page, Text child) {
    return TextButton(
      child: child,
      onPressed: () => PageNavigator().goTo(context, page),
    );
  }

  Widget BuildBackElivatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => PageNavigator().goBack(context),
      child: Text("Back"),
    );
  }

  BuildElivatedButtonToPage(BuildContext context, Widget page, String title) {
    return ElevatedButton(
      onPressed: () => PageNavigator().goTo(context, page),
      child: Text("Login"),
    );
  }


}
