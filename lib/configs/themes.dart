import 'package:anki_like_app/configs/constants.dart';
import 'package:anki_like_app/configs/styles/palette.dart';
import 'package:flutter/material.dart';

Palette palette = Palette();
final appTheme = ThemeData(
  primaryColor: palette.green,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: palette.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: palette.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ))),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(circularCardBorder),
    ),
    backgroundColor: palette.green,
    titleTextStyle: TextStyle(
      color: palette.trueWhite,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    contentTextStyle: TextStyle(
      color: palette.trueWhite,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
  ),
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
