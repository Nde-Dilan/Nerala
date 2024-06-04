import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int duration;
  const FadeInAnimation({super.key, required this.child, required this.duration});

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _scaleAnimation, _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration:  Duration(
        milliseconds: widget.duration,
      ),
      vsync: this,
    );
    super.initState();

    /// Creating the tween for the animation, but wait what's a tween?
    _scaleAnimation = Tween<double>(begin: 0.90, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutSine));
    _opacityAnimation = Tween<double>(begin: 0.50, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutSine));

    //Kickstart the animation

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(_scaleAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
