import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class LottieAnimator extends StatefulWidget {
  final String assetPath;
  final double width;
  final double height;
  final Duration duration;

  const LottieAnimator({
    super.key,
    required this.assetPath,
    this.width = 200,
    this.height = 200,
    this.duration = const Duration(milliseconds: 5000),
  });

  @override
  State<LottieAnimator> createState() => _LottieAnimatorState();
}

class _LottieAnimatorState extends State<LottieAnimator> with TickerProviderStateMixin {
  late AnimationController _hingeController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _dropAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _initHingeController();
    _initRotationAnimation();
    _initDropAnimation();
    _initOpacityAnimation();
    _hingeController.forward();
  }

  void _initHingeController() {
    _hingeController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
  }

  void _initRotationAnimation() {
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 30.0 * (math.pi / 180),
    ).animate(CurvedAnimation(
      parent: _hingeController,
      curve: const Interval(0.6, 0.8, curve: Curves.easeInOut),
    ));
  }

  void _initDropAnimation() {
    _dropAnimation = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _hingeController,
      curve: const Interval(0.8, 1.0, curve: Curves.bounceOut),
    ));
  }

  void _initOpacityAnimation() {
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _hingeController,
      curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
    ));
  }

  @override
  void dispose() {
    _hingeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hingeController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _dropAnimation.value),
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Lottie.asset(
                widget.assetPath,
                width: widget.width,
                height: widget.height,
              ),
            ),
          ),
        );
      },
    );
  }
}
