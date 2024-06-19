import 'package:anki_like_app/configs/styles/palette.dart';
import 'package:flutter/material.dart';

Palette palette = Palette();
final appTheme = ThemeData(
  primaryColor: palette.green,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: palette.trueWhite,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    displayLarge: TextStyle(
        color: palette.trueWhite, fontWeight: FontWeight.bold, fontSize: 58),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: palette.green,
    titleTextStyle: TextStyle(
      color: palette.trueWhite,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: palette.trueWhite,
  useMaterial3: true,
);
