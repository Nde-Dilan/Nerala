import 'package:flutter/material.dart';

class FlashCardsNotifier extends ChangeNotifier {
  String topic = "";

  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }
}
