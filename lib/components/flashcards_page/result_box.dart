import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/notifiyers/statistic_notifier.dart';
import 'package:anki_like_app/pages/flashcards_page.dart';
import 'package:anki_like_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FlashCardsNotifier, StatsCardsNotifier>(
      builder: (BuildContext context, FlashCardsNotifier notifier,
              StatsCardsNotifier statsNotifier, Widget? child) =>
          AlertDialog(
        title: Center(
          child: Text(notifier.isSessionCompleted
              ? 'Session Completed'
              : 'Round Completed!🚀'),
        ),
        actions: <Widget>[
          Table(
            children: [
              buildTableRow(
                  title: 'Round',
                  stat: statsNotifier
                      .getRoundCount(notifier.word1.topic)
                      .toString()),
              buildTableRow(
                  title: 'Cards',
                  stat: statsNotifier
                      .getCardCount(notifier.word1.topic)
                      .toString()),
              buildTableRow(
                  title: 'Correct',
                  stat: statsNotifier
                      .getCorrectCount(notifier.word1.topic)
                      .toString()),
              buildTableRow(
                  title: 'Incorrect',
                  stat: statsNotifier
                      .getIncorrectCount(notifier.word1.topic)
                      .toString()),
              buildTableRow(
                  title: 'Percentage',
                  stat: statsNotifier
                      .getCorrectPercentage(notifier.word1.topic)
                      .toString()),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              notifier.isSessionCompleted
                  ? const SizedBox()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        //Refresh the page to retest the incorrect cards
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FlashCardsPage()));
                      },
                      child: Text(
                        "Retest Incorrect Cards",
                        style: TextStyle(
                            color: palette.trueWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: palette.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                onPressed: () {
                  notifier.isSessionCompleted = false;

                  //Store the stats for the topic inside the db
                  statsNotifier.storeStatsForTopic(topic: notifier.word1.topic);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false);
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                      color: palette.trueWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          stat,
          textAlign: TextAlign.right,
        ),
      )),
    ]);
  }
}
