import 'package:flutter/material.dart';

class ButAyaNumber extends StatelessWidget {
  String verses;
  int index;

  ButAyaNumber({required this.verses, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$verses ${index + 1}",
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
