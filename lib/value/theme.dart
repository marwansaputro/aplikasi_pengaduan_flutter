// Flutter imports:
import 'package:flutter/material.dart';

const black = Color(0xff202223);
const darkblue = Color(0xFF033C5C);
const primaryGreen = Color(0xff25A751);
const white = Color(0xffFFFFFF);
const primaryGrey = Color(0xFFE0E0E0);
const grey = Color(0xFFFAFAFA);
const darkGrey = Color(0xFF888888);
const red = Color(0xFFFF0000);

final nLightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff307FE2),
  ).copyWith(
    primary: const Color(0xff25A751),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(Color(0xff1094DD)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      padding: MaterialStatePropertyAll(
        const EdgeInsets.all(22).copyWith(
          left: 20,
          right: 20,
        ),
      ),
      textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.white)),
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 60,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 48,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 36,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 18,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 13,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
    ),
  ),
);
