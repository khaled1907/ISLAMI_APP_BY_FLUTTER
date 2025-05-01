import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/taps/hadeth_tap/hadeth_screen.dart';
import '../taps/quran_tap/quran_screen.dart';
import '../taps/radio_tap/radio_screen.dart';
import '../taps/tasbeh_tap/tasbeh_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    Quran_tab(),
    Hadeth_tap(),
    TasbehScreen(),
    RadioScreen(),
    Column(),
  ];

  int index = 1;

  void changeIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.appName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_light.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: tabs[index]),
        bottomNavigationBar: BottomNavigationBar(
            onTap: changeIndex,
            currentIndex: index,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quran.png")),
                label: AppLocalizations.of(context)!.quranIconName,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/hadeth.png")),
                label: AppLocalizations.of(context)!.hadithIconName,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                label: AppLocalizations.of(context)!.sebihaIconName,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/radio.png")),
                label: AppLocalizations.of(context)!.radioIconName,
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.sebihaIconName,
              ),
            ]));
  }
}
