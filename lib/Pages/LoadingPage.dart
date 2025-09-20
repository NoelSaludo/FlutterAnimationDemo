import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';
import 'package:flutteranimationdemo/utils/LottieAnimator.dart';
import 'package:flutteranimationdemo/utils/PageNavigator.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {
  MyHomePage _home = MyHomePage(title: "Home");

  late LottieAnimator lottieAnimator;
  late Widget loadingLottie;

  void initState() {
    super.initState();
    lottieAnimator = LottieAnimator(vsync: this);
    lottieAnimator.hingeController.forward();

    loadingLottie = Lottie.asset(
      'assets/loading.json',
      width: 200,
      height: 200,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFutureBuilder(context);
  }

  Widget _buildFutureBuilder(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildWaitingPage();
        } else if (snapshot.hasError) {
          return _buildErrorPage(snapshot.error);
        } else {
          return _buildRoutingPage(context);
        }
      },
    );
  }

  Widget _buildWaitingPage() {
    return Scaffold(
      body: Center(child: lottieAnimator.applyHingeAnimation(loadingLottie)),
    );
  }

  Widget _buildErrorPage(Object? error) {
    return Scaffold(body: Center(child: Text("Error: $error")));
  }

  Widget _buildRoutingPage(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PageNavigator().goTo(context, _home);
    });
    return Scaffold(
      body: Center(child: lottieAnimator.applyHingeAnimation(loadingLottie)),
    );
  }

  Future<String> loadData() async {
    await Future.delayed(Duration(seconds: 5));
    return "Data Loaded";
  }
}
