import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = Color(0xFFB7935F);
  static Color colorBlack = Color(0xFF242424);
  static Color colorWhite = Color(0xFFF8F8F8);

  static Color darkPrimary = Color(0xFF141A2E);
  static Color darkGold = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    canvasColor: colorBlack,
    cardColor: colorWhite,
    dividerColor: lightPrimary,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 35,
        color: colorBlack,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.normal,
        color: colorBlack,
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: colorBlack),
      color: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        selectedItemColor: colorBlack,
        unselectedItemColor: colorWhite,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: colorBlack),
        selectedIconTheme: IconThemeData(color: colorBlack)),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkGold,
    canvasColor: Colors.white,
    cardColor: colorBlack,
    dividerColor: darkGold,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF8F8F8),
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF8F8F8),
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.normal,
        color: Color(0xFFF8F8F8),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: colorWhite),
      color: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkPrimary,
        selectedItemColor: darkGold,
        unselectedItemColor: colorWhite,
        showUnselectedLabels: true,
        showSelectedLabels: true,

//        selectedLabelStyle: TextStyle(color: darkGold),
        selectedIconTheme: IconThemeData(color: darkGold)),
  );
}
