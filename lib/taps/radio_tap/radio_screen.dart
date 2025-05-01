import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset('assets/images/radio_image.png'),
          const SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.radioNameTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                AssetImage("assets/images/back_icon.png"),
                color: Theme.of(context).primaryColor,
              ),
              ImageIcon(
                AssetImage("assets/images/play_icon.png"),
                color: Theme.of(context).primaryColor,
              ),
              ImageIcon(
                AssetImage("assets/images/next_icon.png"),
                color: Theme.of(context).primaryColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
