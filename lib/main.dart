import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/taps/quran_tap/quran_screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale presentLocal = Locale('en');

  void changeLocal(Locale locale) {
    setState(() {
      presentLocal = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: presentLocal,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'), // English
        Locale('en'), // Spanish
      ],
      home: Quran_tab(),
    );
  }
}
