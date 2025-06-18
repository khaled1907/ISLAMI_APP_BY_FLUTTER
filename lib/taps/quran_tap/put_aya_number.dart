import 'package:flutter/material.dart';

class PutAyaNumber extends StatelessWidget {
  String verses;
  int index;

  PutAyaNumber({super.key, required this.verses, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
       textDirection:TextDirection.rtl,
        "$verses (${index + 1})",
        style: TextStyle(color: Theme.of(context).primaryColor,),
        textAlign: TextAlign.center,
      ),
    );
  }
}
