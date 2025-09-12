import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/shared/PageNavigator.dart';

class ButtonBuilder {
  Widget buildRouteTextButton(BuildContext context, Widget page, String child) {
    return TextButton(
      child: Text(child),
      onPressed: () => PageNavigator.goTo(context, page),
    );
  }
}
