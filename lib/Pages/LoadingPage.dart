import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';
import 'package:flutteranimationdemo/utils/LottieAnimator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.PageToLoad});

  final Widget PageToLoad;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<String> loadData() async {
    await Future.delayed(Duration(seconds: 5));
    return "Data Loaded";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: LottieAnimator(
                assetPath: 'assets/loading.json',
                width: 200,
                height: 200,
                duration: Duration(milliseconds: 5000),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: {snapshot.error}")),
          );
        } else {
          return MyHomePage(title: "Home Page");
        }
      },
    );
  }
}
