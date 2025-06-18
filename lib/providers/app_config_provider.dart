import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String language) async {
    if (language == appLanguage) {
      return;
    }
    appLanguage = language;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("language", language);
  }

  void changeTheme(ThemeMode newTheme) async {
    if (newTheme == appTheme) {
      return;
    } notifyListeners();

    appTheme = newTheme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "theme", newTheme == ThemeMode.dark ? "dark" : "light");
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

  bool isEnglish() {
    return appLanguage == "en";
  }

  loadSettingsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString("language");
    if (savedLanguage != null) {
      appLanguage = savedLanguage;
    }

    final savedTheme = prefs.getString("theme");
    if (savedTheme == "dark") {
      appTheme = ThemeMode.dark;
    } else if (savedTheme == "light") {
      appTheme = ThemeMode.light;
    } else {
      appTheme = ThemeMode.system;
    }

    notifyListeners();
  }
}
