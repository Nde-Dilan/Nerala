import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/animations/half_flip_animation.dart';
import 'package:anki_like_app/animations/slide_animation.dart';
import 'package:anki_like_app/components/flashcards_page/card_display.dart';
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

          /// The ignoreTouch is set to true to prevent the user from interacting with the card while it is flipping
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
              /// The resetSlideCard1 is called to reset the card to its original position and when the animation is completed, the ignoreTouch is set to false like that we can interact with the card again
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            //Run it if the notifier.slideCard1 is true and the round is not completed
            animate: notifier.slideCard1 && !notifier.isRoundCompleted,
            duration: 500,
            // delay: 200,
            slideDirection: SlideDirection.upIn,
            child: FadeInAnimation(
              duration: 500,
              child: CardDisplay(
                size: size,
                isCardOne: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
