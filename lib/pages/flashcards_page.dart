import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/animations/slide_animation.dart';
import 'package:anki_like_app/app/custom_appbar.dart';
import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({super.key});

  @override
  State<FlashCardsPage> createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56), child: CustomAppBar()),
        body: SlideAnimation(
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
        backgroundColor: Colors.red,
      ),
    );
  }
}
