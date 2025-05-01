import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehScreen extends StatefulWidget {
  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  int numberOfTasbeh = 0;

  int index = 0;
  double angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Transform.rotate(
            angle: angle,
            child: Image.asset('assets/images/tasbeh_image.png'),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.numberOfTasabeh,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                numberOfTasbeh.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight:
                        Theme.of(context).textTheme.bodyMedium!.fontWeight),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              increaseTasbeh();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  getCureentTasbeeh(index),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontWeight:
                          Theme.of(context).textTheme.bodyMedium!.fontWeight),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  increaseTasbeh() {
    numberOfTasbeh++;
    if (numberOfTasbeh == 33 && index == 0) {
      index = 1;
      numberOfTasbeh = 0;
    }
    if (numberOfTasbeh == 33 && index == 1) {
      index = 2;
      numberOfTasbeh = 0;
    }
    if (numberOfTasbeh == 33 && index == 2) {
      index = 0;
      numberOfTasbeh = 0;
    }
    setState(() {
      angle += 2 * pi / 33;
    });
  }

  getCureentTasbeeh(int index) {
    if (index == 0) {
      return AppLocalizations.of(context)!.sobhanAllah;
    } else if (index == 1) {
      return AppLocalizations.of(context)!.elhamedLAllah;
    }
    if (index == 2) {
      return AppLocalizations.of(context)!.allahAkaber;
    }
  }
}
