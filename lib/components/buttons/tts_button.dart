import 'dart:math';

import 'package:anki_like_app/configs/constants.dart';
import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class TextToSpeechButton extends StatefulWidget {
  const TextToSpeechButton({super.key});

  @override
  State<TextToSpeechButton> createState() => _TextToSpeechButtonState();
}

class _TextToSpeechButtonState extends State<TextToSpeechButton> {
  bool _isTapped = false;

  late FlutterTts _flutterTts;

  @override
  void initState() {
    _flutterTts = FlutterTts();
    Future.delayed(const Duration(milliseconds: 500), () {
      _setUpTTS();
    });
    super.initState();
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardsNotifier>(
      builder:
          (BuildContext context, FlashCardsNotifier notifier, Widget? child) =>
              Expanded(
        child: IconButton(
            onPressed: () {
              _runTts(text: notifier.word1.character);
              setState(() {
                _isTapped = !_isTapped;
              });
              Future.delayed(const Duration(milliseconds: 500), () {
                setState(() {
                  _isTapped = !_isTapped;
                });
              });
            },
            icon: Transform(
              transform: Matrix4.rotationY(pi),
              alignment: Alignment.center,
              child: Icon(
                Icons.volume_up,
                size: 50,
                color: _isTapped ? palette.gray : palette.trueWhite,
              ),
            )),
      ),
    );
  }

  void _setUpTTS() async {
    await _flutterTts.setLanguage(languageCode);

    // _flutterTts.getLanguages.then((languages) {
    //   print("languages: $languages");
    // });

    await _flutterTts.setSpeechRate(0.4);
  }

  _runTts({required String text}) async {
    await _flutterTts.speak(text);
  }
}
