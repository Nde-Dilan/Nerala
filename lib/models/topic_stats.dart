class TopicStats {
  int? id;
  int roundCount;
  int cardCount;
  int correctCount;
  int incorrectCount;
  int correctPercentage;

  TopicStats({
    this.roundCount = 0,
    this.cardCount = 0,
    this.correctCount = 0,
    this.incorrectCount = 0,
    this.correctPercentage = 0,
  });

  void calculateCorrectPercentage() {
    if (cardCount > 0) {
      correctPercentage = ((correctCount / cardCount) * 100).round();
    } else {
      correctPercentage = 0;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'roundCount': roundCount,
      'cardCount': cardCount,
      'correctCount': correctCount,
      'incorrectCount': incorrectCount,
      'correctPercentage': correctPercentage,
    };
  }

  factory TopicStats.fromMap(Map<String, dynamic> map) {
    return TopicStats(
      roundCount: map['roundCount'],
      cardCount: map['cardCount'],
      correctCount: map['correctCount'],
      incorrectCount: map['incorrectCount'],
      correctPercentage: map['correctPercentage'],
    );
  }
}
