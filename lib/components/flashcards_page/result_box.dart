import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/pages/flashcards_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              AlertDialog(
        title: Center(
          child: Text(notifier.isSessionCompleted
              ? 'Session Completed'
              : 'Round Completed!🚀'),
        ),
        actions: <Widget>[
          ElevatedButton(
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
              Navigator.of(context).pop();
            },
            child: Text(
              'Close',
              style: TextStyle(
                  color: palette.trueWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
