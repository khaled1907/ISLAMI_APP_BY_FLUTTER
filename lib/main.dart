import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/appTheme/AppTheme.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/taps/hadeth_tap/show_hadeth_details.dart';
import 'package:islami_app/taps/quran_tap/show_ayet_sura.dart';

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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: presentLocal,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // English
        Locale('en'), // Spanish
      ],
      home: HomeScreen(),
      initialRoute: HomeScreen.routeName,
      routes: {
        ShowSuraDetalis.routeName: (context) => ShowSuraDetalis(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ShowHadethDetails.routeName: (context) => ShowHadethDetails(),
      },
    );
  }
}
