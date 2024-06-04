import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/pages/home_page.dart';
import 'package:anki_like_app/pages/test_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
          HomePage(),
          MyWidget(color: Colors.red),
          MyWidget(color: Colors.green),
          MyWidget(color: Colors.black),
          MyWidget(color: Colors.orange),
          MyWidget(color: Colors.yellow),
        ],
      ),
    );
  }
}
