import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FlashCardsNotifier())
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcards',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: PageView(
        children: const [
          Dashboard(), // Set Dashboard as the initial page
        ],
      ),
    );
  }
}
