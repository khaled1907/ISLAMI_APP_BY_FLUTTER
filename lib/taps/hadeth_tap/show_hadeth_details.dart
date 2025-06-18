import 'package:flutter/material.dart';
import 'package:islami_app/taps/hadeth_tap/hadeth_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class ShowHadethDetails extends StatelessWidget {
  static String routeName = "ShowHadethDetails";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        provider.isDark()
            ? "assets/images/back_ground_dark.png"
            : "assets/images/background_light.png",
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
              color: Theme.of(context).cardColor,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Text(
                    args.content[index],
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  );
                },
                itemCount: args.content.length),
          ),
        ),
      ),
    ]);
  }
}
