import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, required this.PageToLoad});

  final Widget PageToLoad;
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
          return Scaffold(body: Center(child: Lottie.asset('assets/loading.json')));
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        } else {
          return MyHomePage(title: "Home Page"); 
        }
      },
    );
  }
}
