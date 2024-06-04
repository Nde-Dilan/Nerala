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
  )),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
    color: palette.trueWhite,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  ),
  scaffoldBackgroundColor: palette.trueWhite,
  useMaterial3: true,
);
