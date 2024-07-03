import 'package:anki_like_app/databases/db_manager.dart';
import 'package:anki_like_app/models/topic_stats.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';



    Logger _log = Logger('statistic_notifier.dart');


class StatsCardsNotifier extends ChangeNotifier {
  final Map<String, TopicStats> statsPerTopic = {};

  void calculateCorrectPercentage({required String topic}) {
    if (statsPerTopic.containsKey(topic)) {
      statsPerTopic[topic]?.calculateCorrectPercentage();
      notifyListeners();
    }
  }

  TopicStats getStatsForTopic(String topic) {
    statsPerTopic.putIfAbsent(topic, () => TopicStats());
    return statsPerTopic[topic]!;
  }

  void updateStatsForTopic({
    required String topic,
    int? roundCount,
    int? cardCount,
    int? correctCount,
    int? incorrectCount,
  }) {
    TopicStats stats = getStatsForTopic(topic);

    if (roundCount != null) stats.roundCount = roundCount;
    if (cardCount != null) stats.cardCount = cardCount;
    if (correctCount != null) stats.correctCount = correctCount;
    if (incorrectCount != null) stats.incorrectCount = incorrectCount;

    stats.calculateCorrectPercentage();
    notifyListeners();
  }

  ///Getters
  int getRoundCount(String topic) => getStatsForTopic(topic).roundCount;
  int getCardCount(String topic) => getStatsForTopic(topic).cardCount;
  int getCorrectCount(String topic) => getStatsForTopic(topic).correctCount;
  int getIncorrectCount(String topic) => getStatsForTopic(topic).incorrectCount;
  int getCorrectPercentage(String topic) => getStatsForTopic(topic).correctPercentage;

  void setRoundCount(String topic, int round) {
    getStatsForTopic(topic).roundCount = round;
    notifyListeners();
  }

  void setCardCount(String topic, int count) {
    getStatsForTopic(topic).cardCount = count;
    notifyListeners();
  }

  void setCorrectCount(String topic, int count) {
    getStatsForTopic(topic).correctCount = count;
    notifyListeners();
  }

  void setIncorrectCount(String topic, int count) {
    getStatsForTopic(topic).incorrectCount = count;
    notifyListeners();
  }

  void setCorrectPercentage(String topic, int newCorrectPercentage) {
    getStatsForTopic(topic).correctPercentage = newCorrectPercentage;
    notifyListeners();
  }

  void updateAllStatsForTopic({
    required String topic,
    required int newRoundCount,
    required int newCardCount,
    required int newCorrectCount,
    required int newIncorrectCount,
    required int newCorrectPercentage,
  }) {
    TopicStats stats = getStatsForTopic(topic);
    stats.roundCount = newRoundCount;
    stats.cardCount = newCardCount;
    stats.correctCount = newCorrectCount;
    stats.incorrectCount = newIncorrectCount;
    stats.correctPercentage = newCorrectPercentage;
    notifyListeners();
  }


  @override
  String toString() {
    return 'StatsCardsNotifier{statsPerTopic: $statsPerTopic}';
  }

  // Method to store the stats of a topic
  Future<void> storeStatsForTopic({required String topic}) async {
    TopicStats stats = getStatsForTopic(topic);
    _log.info("Storing the value inside the database : ${stats.toMap().toString()}");
    await DatabaseManager().insertTopicStats(topic, stats);
  }

  
}
