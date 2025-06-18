import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/cache/cacheHelper/cacheData.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.isEnglish()
                  ? selectedLnguage(AppLocalizations.of(context)!.english)
                  : unselectedLnguage(AppLocalizations.of(context)!.english),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.isEnglish()
                  ? unselectedLnguage(AppLocalizations.of(context)!.arabic)
                  : selectedLnguage(AppLocalizations.of(context)!.arabic),
            ),
          ],
        ),
      ),
    );
  }

  selectedLnguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
      ],
    );
  }

  unselectedLnguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
