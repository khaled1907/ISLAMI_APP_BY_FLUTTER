import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/taps/quran_tap/put_aya_number.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class ShowSuraDetalis extends StatefulWidget {
  static String routeName = "ShowSuraDetalis";

  @override
  State<ShowSuraDetalis> createState() => _ShowSuraDetalisState();
}

class _ShowSuraDetalisState extends State<ShowSuraDetalis> {
  List<String> verses = [];

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ShowSuraDetalisArg;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return verses.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Stack(children: [
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
                  args.Name,
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
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return PutAyaNumber(
                            index: index, verses: verses[index]);
                      },
                      separatorBuilder: (context, index) => const Divider(
                            thickness: 2,
                          ),
                      itemCount: verses.length),
                ),
              ),
            ),
          ]);
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = file.split("\n");

    setState(() {
      verses = lines;
      verses = verses.where((v) => v.trim().isNotEmpty).toList();
    });
  }
}

class ShowSuraDetalisArg {
  String Name;
  int index;

  ShowSuraDetalisArg({required this.Name, required this.index});
}
