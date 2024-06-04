import 'package:flutter/material.dart';

class FlashCardsNotifier extends ChangeNotifier {
  String topic = "";

  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }

  bool flipCard1 = false;

  runFlipCard1() {
    flipCard1 = true;
    notifyListeners();
  }

  bool flipCard2 = false;

  runFlipCard2() {
    flipCard2 = true;
    notifyListeners();
  }
  unRunFlipCard2() {
    flipCard2 = false;
    notifyListeners();
  }
}
