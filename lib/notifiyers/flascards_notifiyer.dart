import 'dart:math';

import 'package:anki_like_app/components/flashcards_page/result_box.dart';
import 'package:anki_like_app/configs/constants.dart';
import 'package:anki_like_app/data/words.dart';
import 'package:anki_like_app/enums/slide_directions.dart';
import 'package:anki_like_app/models/word.dart';
import 'package:flutter/material.dart';

class FlashCardsNotifier extends ChangeNotifier {
  /// List of all the incorrect cards
  List<Word> incorrectCards = [];

  ///Tracking of the rounds
  bool isFirstRound = true, isRoundCompleted = false, isSessionCompleted = false;

  resetBool(){
    isFirstRound = true;
    isRoundCompleted = false;
    isSessionCompleted = false;
  }
  updateCardOutcome({required Word word, required bool isCorrect}) {
    if (!isCorrect) {
      incorrectCards.add(word);
    }
    notifyListeners();

    incorrectCards.forEach((element) {
      print(element.english);
    });
  }

  String topic = "";

  ///Word you will find on the card at any given moment
  Word word1 =
      Word(topic: "", english: "Loading Arrow", character: "", pinyin: "");
  Word word2 = Word(topic: "", english: "", character: "", pinyin: "");

  /// All the words for a selected topic
  List<Word> selectedWords = [];

  ///Set the topic of the words when the user changes topic
  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWords() {
    ///Make sure it's empty before trying to populate it
    selectedWords.clear();
    isRoundCompleted = false;
    if (isFirstRound) {
      selectedWords = words.where((element) => element.topic == topic).toList();
    } else {
      if (incorrectCards.isEmpty) {
        isSessionCompleted = true;
      }
      selectedWords = incorrectCards.toList();
      incorrectCards.clear();
    }
  }

  ///Generate a random word from the selected words
  generateCurrentWord({required BuildContext context}) {
    if (selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    } else {
      isRoundCompleted = true;
      isFirstRound = false;
      Future.delayed(const Duration(milliseconds: 500), () {
        showDialog(context: context, builder: (context) => const ResultBox());
      });
    }

    Future.delayed(const Duration(milliseconds: slideAnimDuration), () {
      word2 = word1;
    });
  }

  /// Animation code

  bool shouldIIgnoreTouch = true;

  setIgnoreTouch({required bool ignore}) {
    shouldIIgnoreTouch = ignore;
    notifyListeners();
  }

  SlideDirection swipeDirection = SlideDirection.none;

  ///Slide and Flip effects
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
    updateCardOutcome(
        word: word1, isCorrect: direction == SlideDirection.leftAway);
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
