import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/pages/home_page.dart';
import 'package:anki_like_app/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FlashCardsNotifier())],
      child: const MyApp()));
}

/**
 * https://github.com/Nde-Dilan/Nerala.git


Okay so what I expect from you is to create a kind of stats-home page :

On that home page you can have some statistique about the progression of the student's learing like : number of cards learnt today, the strike(total number of cumulated days), and other stats


Under that section what We need is a grid containing what the application is offereing like 

Flascards, stories, annecdotes, revision section and of course a chat bot assistant.

I will send images of How I am seeing it if it can help
 */


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nerala',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: PageView(
        children: const [
          WelcomePage(),
          //
          HomePage(),
        ],
      ),
    );
  }
}
