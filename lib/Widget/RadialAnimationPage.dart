import 'package:flutter/material.dart';

class RadialAnimationScreen extends StatelessWidget {
  const RadialAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Hero Animation'),
      ),
      body: const Center(
        child: Text('Animation Here :)'),
      ),
    );
  }
}