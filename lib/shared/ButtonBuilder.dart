import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/Home.dart';
import 'package:flutteranimationdemo/shared/PageNavigator.dart';

class ButtonBuilder {
  Widget BuildLottieButton(BuildContext context) {
    return TextButton(
      child: Text("Lottie Page"),
      onPressed: () => PageNavigator().goTo(context, LottiePage()),
    );
  }

  Widget BuildBackElivated(BuildContext context) {
    return ElevatedButton(
      onPressed: () => PageNavigator().goBack(context),
      child: Text("Back"),
    );
  }
}
