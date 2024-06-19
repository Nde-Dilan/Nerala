import 'package:anki_like_app/app/custom_appbar.dart';
import 'package:anki_like_app/components/flashcards_page/card_one.dart';
import 'package:anki_like_app/components/flashcards_page/card_two.dart';
import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({super.key});

  @override
  State<FlashCardsPage> createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {
  @override
  void initState() {
    //Since we need to access the buildcontext we need to wrap our provider call inside this [addPostFrameCallback]
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///Calling provide inside initState normally isn't accepted, but you can use the addPostFrameCallback to get the context and do it.

      final flascardsNotifier =
          Provider.of<FlashCardsNotifier>(context, listen: false);
      flascardsNotifier.runSlideCard1();
      flascardsNotifier.generateAllSelectedWords();
      flascardsNotifier.generateCurrentWord();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56), child: CustomAppBar()),
        body: IgnorePointer(
          //Use to help its children ignore all touch events
          ignoring: notifier.shouldIIgnoreTouch,
          child: const Stack(
            children: [
              CardTwo(),
              CardOne(),
            ],
          ),
        ),
        backgroundColor: palette.trueWhite,
      ),
    );
  }
}
