import 'package:flutter/material.dart';
import 'package:islami_app/taps/hadeth_tap/hadeth_screen.dart';

class ShowHadethDetails extends StatelessWidget {
  static String routeName = "ShowHadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        "assets/images/background_light.png",
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: Center(
          heightFactor: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Text(args.content[index]);
                },
                itemCount: args.content.length),
          ),
        ),
      ),
    ]);
  }
}
