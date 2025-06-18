import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/taps/settings_tap/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import 'language_bottom_sheet.dart';

class SettinsScreen extends StatelessWidget {
  const SettinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(AppLocalizations.of(context)!.languageTitleName),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: InkWell(
              onTap: () {
                showBottomSheetForLanguage(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(provider.isEnglish()
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic),
                      Icon(Icons.arrow_drop_down,color: Theme.of(context).canvasColor)
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.themeType),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: InkWell(
              onTap: () {
                showBottomSheetForTheme(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.isDark()
                            ? AppLocalizations.of(context)!.dark
                            : AppLocalizations.of(context)!.light,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).canvasColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showBottomSheetForLanguage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showBottomSheetForTheme(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
