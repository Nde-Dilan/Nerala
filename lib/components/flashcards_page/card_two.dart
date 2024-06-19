import 'dart:math';

import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/animations/half_flip_animation.dart';
import 'package:anki_like_app/animations/slide_animation.dart';
import 'package:anki_like_app/components/card_display.dart';
import 'package:anki_like_app/configs/constants.dart';
import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The back of a card, the one containing the response
class CardTwo extends StatelessWidget {
  const CardTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    /// The Consumer widget is used to listen to the changes in the FlashCardsNotifier
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              GestureDetector(
        /// The onHorizontalDragEnd is used to detect the direction of the swipe
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
          if (details.primaryVelocity! < 100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
        },
        child: HalfFlipAnimation(
          duration: 400,
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: () {
            /// The resetCardTwo is called to reset the card to its original position and when the animation is completed, the ignoreTouch is set to false like that we can interact with the card again
            notifier.setIgnoreTouch(ignore: false);
            // notifier.resetCardTwo();
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCardTwo();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            duration: slideAnimDuration,
            slideDirection: notifier.swipeDirection,
            child: FadeInAnimation(
              duration: 1500,
              child: CardDisplay(
                isCardOne: false,
                size: size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
