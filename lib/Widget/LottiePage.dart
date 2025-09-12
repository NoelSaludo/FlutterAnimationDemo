import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/shared/ButtonBuilder.dart';

class LottiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ButtonBuilder().BuildBackElivatedButton(context)),
    );
  }
}
