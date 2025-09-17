import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.PageToLoad});

  final Widget PageToLoad;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _hingeController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _dropAnimation;
  late Animation<double> _opacityAnimation;

  Future<String> loadData() async {
    await Future.delayed(Duration(seconds: 5));
    return "Data Loaded";
  }

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with longer duration to include delay
    _hingeController = AnimationController(
      duration: Duration(milliseconds: 5000), // 3s delay + 2s animation
      vsync: this,
    );

    // Create rotation animation 30 degrees after 3s delay
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 30.0 * (math.pi / 180), // Convert degrees to radians
    ).animate(CurvedAnimation(
      parent: _hingeController,
      curve: Interval(0.6, 0.8, curve: Curves.easeInOut),
    ));

    // create drop animation
    _dropAnimation = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _hingeController,
      curve: Interval(0.8, 1.0, curve: Curves.bounceOut),
    ));

    // Create opacity animation for fade effect during drop
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _hingeController,
      curve: Interval(0.8, 1.0, curve: Curves.easeIn),
    ));

    // Start the hinge animation
    _hingeController.forward();
  }

  @override
  void dispose() {
    _hingeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: AnimatedBuilder(
                animation: _hingeController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _dropAnimation.value),
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Lottie.asset(
                          'assets/loading.json',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
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
