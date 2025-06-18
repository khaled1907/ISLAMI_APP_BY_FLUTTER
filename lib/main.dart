import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/appTheme/AppTheme.dart';
import 'package:islami_app/cache/cacheHelper/cacheData.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/taps/hadeth_tap/show_hadeth_details.dart';
import 'package:islami_app/taps/quran_tap/show_ayet_sura.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();

  final  appConfigProvider = AppConfigProvider();
  appConfigProvider.loadSettingsFromPrefs();
  runApp(
    ChangeNotifierProvider(
      create: (context) => appConfigProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
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
