import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/animations/half_flip_animation.dart';
import 'package:anki_like_app/animations/slide_animation.dart';
import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The front of a card, the one containing the questions
class CardOne extends StatelessWidget {
  const CardOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              GestureDetector(
        onDoubleTap: () {
          notifier.runFlipCard1();
          notifier.setIgnoreTouch(ignore: true);
        },
        child: HalfFlipAnimation(
          duration: 400,
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: () {
            // When you finish flipping the first card with an angle of pi/2, animate the second card
            notifier.runFlipCard2();
            // And then let's go back to the previous state
            notifier.resetCardOne();
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
            duration: 1000,
            slideDirection: SlideDirection.upIn,
            child: FadeInAnimation(
              duration: 1500,
              child: Center(
                child: Container(
                  child: Text("Card1"),
                  width: size.width * .5,
                  height: size.height * 0.5,
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
