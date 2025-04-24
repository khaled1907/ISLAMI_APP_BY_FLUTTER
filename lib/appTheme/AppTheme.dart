import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xB7935F),
      secondary: Color(0xFFFFFF),
      tertiary: Color(0x242424),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0x242424),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0x242424),
      ),
      headlineSmall:
          TextStyle(fontWeight: FontWeight.normal, color: Color(0x242424)),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,elevation: 0,

    ),
    scaffoldBackgroundColor:Colors.transparent
  );
  ThemeData darkTheme = ThemeData(

    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0x141A2E),
      secondary: Color(0xFACC1D),
      tertiary: Color(0xF8F8F8),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xF8F8F8),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xF8F8F8),
      ),
      headlineSmall:
      TextStyle(fontWeight: FontWeight.normal, color: Color(0xF8F8F8)),
    ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,elevation: 0,

      ),
      scaffoldBackgroundColor:Colors.transparent
  );
}
