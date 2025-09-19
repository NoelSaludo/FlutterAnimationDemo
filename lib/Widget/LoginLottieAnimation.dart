import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginLottieAnimation extends StatelessWidget {
  const LoginLottieAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25.0),
      child: Lottie.asset(
        "assets/login.json",
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}

