import 'package:anki_like_app/configs/styles/palette.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Palette palette = Palette();

    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              AppBar(
        title: Text(notifier.topic),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
              tag: notifier.topic,
              child: Image.asset("assets/topics/${notifier.topic}.png")),
        ),
        actions: [
          IconButton(
              onPressed: () {
                notifier.resetBool();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
              },
              icon: Icon(
                Icons.clear,
                color: palette.trueWhite,
              ))
        ],
      ),
    );
  }
}
