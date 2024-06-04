import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:flutter/material.dart';

class FlashCardsNotifier extends ChangeNotifier {
  String topic = "";

  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }

  bool shouldIIgnoreTouch = true;

  setIgnoreTouch({required bool ignore}) {
    shouldIIgnoreTouch = ignore;
  }

  SlideDirection swipeDirection = SlideDirection.none;

  bool slideCard1 = false,
      flipCard1 = false,
      flipCard2 = false,
      swipeCard2 = false;
  bool resetSlideCard1 = false,
      resetFlipCard1 = false,
      resetFlipCard2 = false,
      resetSwipeCard2 = false;

  runSlideCard1() {
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1() {
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  runFlipCard2() {
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}) {
    resetSwipeCard2 = false;
    swipeDirection = direction;
    swipeCard2 = true;
    notifyListeners();
  }

  resetCardOne() {
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    flipCard1 = false;
    slideCard1 = false;
  }

  resetCardTwo() {
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipCard2 = false;
    swipeCard2 = false;
  }
}
