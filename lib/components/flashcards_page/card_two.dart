import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/animations/half_flip_animation.dart';
import 'package:anki_like_app/animations/slide_animation.dart';
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
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
          }
          if (details.primaryVelocity! < 100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
          }
        },
        child: HalfFlipAnimation(
          duration: 400,
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: () {
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCardTwo();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            duration: 1000,
            slideDirection: notifier.swipeDirection,
            child: FadeInAnimation(
              duration: 1500,
              child: Center(
                child: Container(
                  width: size.width * .5,
                  height: size.height * 0.5,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Text(notifier.word.pinyin),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
