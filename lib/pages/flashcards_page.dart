import 'package:anki_like_app/app/custom_appbar.dart';
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
  Widget build(BuildContext context) {
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              const Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(56),
        child: CustomAppBar()),
        backgroundColor: Colors.red,
      ),
    );
  }
}
