import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final int duration;
  final bool animate;
  final bool? reset;
  final VoidCallback? animationCompleted;
  final SlideDirection slideDirection;
  const SlideAnimation(
      {super.key,
      required this.child,
      required this.duration,
      required this.slideDirection,
      this.animate = true,
      this.reset,
       this.animationCompleted});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this)
        //Listen for the completion of the animation and notify us
      ..addListener(() {
        if (_animationController.isCompleted) {
          widget.animationCompleted?.call();
        }
      });
      //If it's time launch the animation

    if (widget.animate) {
      _animationController.forward();
    }

    super.initState();
  }

  /// A method on a the state class called when the widget configuration changes, (it's use to run animation on demand)
  @override
  void didUpdateWidget(covariant SlideAnimation oldWidget) {
    //If it's time launch the animation
    if (widget.animate) {
      _animationController.forward();
    }
    if (widget.reset == true) {
      _animationController.reset();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> _animation;

    Tween<Offset> tween =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0));

    switch (widget.slideDirection) {
      case SlideDirection.leftAway:
        tween =
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0));
        break;
      case SlideDirection.rightAway:
        tween =
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0));
        break;
      case SlideDirection.rightIn:
        tween =
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.leftIn:
        tween =
            Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.upIn:
        tween =
            Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      case SlideDirection.none:
        tween =
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0));
        break;
      default:
    }
    _animation = tween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
