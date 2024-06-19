import 'dart:math';

import 'package:anki_like_app/components/buttons/tts_button.dart';
import 'package:anki_like_app/configs/constants.dart';
import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    super.key,
    required this.size,
    required this.isCardOne,
  });

  final Size size;
  final bool isCardOne;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardsNotifier>(
        builder: (BuildContext context, FlashCardsNotifier notifier,
                Widget? child) =>
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02, horizontal: 18),
                width: size.width * .75,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: palette.black, width: borderCardWidth),
                    borderRadius: BorderRadius.circular(circularCardBorder),
                    color: Theme.of(context).primaryColor),
                child: isCardOne
                    ? Column(
                        children: [
                          buildImage(notifier.word1.english),
                          SizedBox(
                            height: size.height * 0.040,
                          ),
                          buildTextBox(
                              notifier.word1.english, context, 1, isCardOne),
                        ],
                      )
                    : Column(
                        children: [
                          buildImage(notifier.word1.english),
                          SizedBox(
                            height: size.height * 0.040,
                          ),
                          buildTextBox(
                              notifier.word2.character, context, 1, isCardOne),
                          const TextToSpeechButton()
                        ],
                      ),
              ),
            ));
  }

  /// If we want to include hand writting characters and the french ones, just modify this method
  Expanded buildTextBox(
      String word, BuildContext context, int flex, bool isCardOne) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          child: isCardOne
              ? Text(word, style: Theme.of(context).textTheme.displayLarge)
              : Transform(
                  transform: Matrix4.rotationY(pi),
                  alignment: Alignment.center,
                  child: Text(word,
                      style: Theme.of(context).textTheme.displayLarge)),
        ),
      ),
    ));
  }

  Expanded buildImage(String imagePath) {
    return Expanded(
        flex: 2, child: Image.asset("assets/topics/$imagePath.png"));
  }
}
