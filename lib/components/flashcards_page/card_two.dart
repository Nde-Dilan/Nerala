import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/animations/half_flip_animation.dart';
import 'package:anki_like_app/animations/slide_animation.dart';
import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTwo extends StatelessWidget {
  const CardTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              InkWell(
        child: HalfFlipAnimation(
          duration: 2000,
          animate: notifier.flipCard2,
          reset: false,
          flipFromHalfWay: true,
          animationCompleted: () {
            notifier.unRunFlipCard2();
          },
          child: SlideAnimation(
            duration: 1000,
            slideDirection: SlideDirection.upIn,
            child: FadeInAnimation(
              duration: 1500,
              child: Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * 0.7,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
