import 'package:flutter/material.dart';
import 'dart:math' as math;

class LottieAnimator {
  late final AnimationController hingeController;

  LottieAnimator({
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 5000),
  }) {
    hingeController = AnimationController(vsync: vsync, duration: duration);
  }

  AnimatedBuilder applyHingeAnimation(Widget lottieWidget) {
    final rotationAnimation = _buildRotationAnimation();
    final dropAnimation = _buildDropAnimation();
    final opacityAnimation = _buildOpacityAnimation();
    return AnimatedBuilder(
      animation: hingeController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, dropAnimation.value),
          child: Transform.rotate(
            angle: rotationAnimation.value,
            child: Opacity(opacity: opacityAnimation.value, child: child),
          ),
        );
      },
      child: lottieWidget,
    );
  }

  Animation<double> _buildRotationAnimation({
    double endDegrees = 30.0,
    double start = 0.6,
    double end = 0.8,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<double>(begin: 0.0, end: endDegrees * (math.pi / 180)).animate(
      CurvedAnimation(
        parent: hingeController,
        curve: Interval(start, end, curve: curve),
      ),
    );
  }

  Animation<double> _buildDropAnimation({
    double dropEnd = 200.0,
    double start = 0.8,
    double end = 1.0,
    Curve curve = Curves.bounceOut,
  }) {
    return Tween<double>(begin: 0.0, end: dropEnd).animate(
      CurvedAnimation(
        parent: hingeController,
        curve: Interval(start, end, curve: curve),
      ),
    );
  }

  Animation<double> _buildOpacityAnimation({
    double opacityEnd = 0.7,
    double start = 0.8,
    double end = 1.0,
    Curve curve = Curves.easeIn,
  }) {
    return Tween<double>(begin: 1.0, end: opacityEnd).animate(
      CurvedAnimation(
        parent: hingeController,
        curve: Interval(start, end, curve: curve),
      ),
    );
  }

  void dispose() {
    hingeController.dispose();
  }
}
