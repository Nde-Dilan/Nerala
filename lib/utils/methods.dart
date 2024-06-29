import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/pages/flashcards_page.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

    Logger _log = Logger('methods.dart');


loadSession({required BuildContext context, required topic}) {

  _log.info("This is the topic: $topic");

  //TODO: Use GoRouter
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const FlashCardsPage()));
  Provider.of<FlashCardsNotifier>(context,listen:false).setTopic(topic: topic);
}
