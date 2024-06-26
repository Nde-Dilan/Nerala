import 'dart:math';

import 'package:flutter/material.dart';

/// This class is responsible for turning the card with an angle of 90

class HalfFlipAnimation extends StatefulWidget {

  /// The widget that will be animated
  final Widget child;
  /// The duration of the animation
  final int duration;

  /// When to start the animation
  final bool animate;

  /// Was the animation reset ?
  final bool reset;

  /// Should the animation start from half way ?
  final bool flipFromHalfWay;

  /// Will be called when animation will be completed and signal the other widget that he can start
  final VoidCallback animationCompleted;
  const HalfFlipAnimation(
      {super.key,
      required this.child,
      required this.duration,
      required this.animate,
      required this.reset,
      required this.flipFromHalfWay,
      required this.animationCompleted});

  @override
  State<HalfFlipAnimation> createState() => _HalfFlipAnimationState();
}

class _HalfFlipAnimationState extends State<HalfFlipAnimation>
    with SingleTickerProviderStateMixin {
      /// the SingleTickerProviderStateMixin is used to provide a TickerProvider(which is ) for the AnimationController
      /// In Flutter, a TickerProvider is an interface that acts as a factory for creating Tickers. Tickers are essentially special periodic timers that are synchronized with the Flutter framework's rendering pipeline. They are used to drive animations in a smooth and efficient way.
      /// More at https://gemini.google.com/app/87c7eca1622ab176
      
      /// The AnimationController is used to control the animation
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this)
      ..addListener(() {
        if (_animationController.isCompleted) {
          widget.animationCompleted.call();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HalfFlipAnimation oldWidget) {
    if (widget.reset) {
      _animationController.reset();
    }

    if (widget.animate) {
      _animationController.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double rotationAdjustement = 0;

    if (widget.flipFromHalfWay) {
      rotationAdjustement = pi / 2;
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY((_animationController.value * pi) / 2)
          ..rotateY(rotationAdjustement),
        child: widget.child,
      ),
    );
  }
}
