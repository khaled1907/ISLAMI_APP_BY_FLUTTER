import 'package:flutter/material.dart';
import 'package:islami_app/taps/quran_tap/show_ayet_sura.dart';

class SingleSuraName extends StatelessWidget {
  String suraName;
  int index;

  SingleSuraName({required this.suraName, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ShowSuraDetalis.routeName,
            arguments: ShowSuraDetalisArg(Name: suraName, index: index));
      },
      child: Text(
        suraName,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
