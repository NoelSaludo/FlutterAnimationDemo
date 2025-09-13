import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/LottiePage.dart';
import 'package:flutteranimationdemo/Widget/RadialAnimationPage.dart';
import 'package:flutteranimationdemo/shared/PageNavigator.dart';

class ButtonBuilder {
  Widget BuildButtonToLottie(BuildContext context) {
    return TextButton(
      child: Text("Lottie Page"),
      onPressed: () => PageNavigator().goTo(context, LottiePage()),
    );
  }

  Widget BuildBackElivatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => PageNavigator().goBack(context),
      child: Text("Back"),
    );
  }

  Widget BuildButtonToRadialAnimation(BuildContext context) {
    return TextButton(
      child: Text("Radial Animation"),
      onPressed: () => PageNavigator().goTo(context, RadialAnimationPage()),
    );
  }


}
