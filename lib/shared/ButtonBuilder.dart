import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/shared/PageNavigator.dart';

class ButtonBuilder {
  Widget BuildRouteButtonToPage(BuildContext context, Widget page, Text child) {
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


}
