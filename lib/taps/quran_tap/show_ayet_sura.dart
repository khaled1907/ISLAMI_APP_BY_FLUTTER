import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'but_aya_number.dart';

class ShowSuraDetalis extends StatefulWidget {
  static String routeName = "ShowSuraDetalis";

  @override
  State<ShowSuraDetalis> createState() => _ShowSuraDetalisState();
}

class _ShowSuraDetalisState extends State<ShowSuraDetalis> {
  List<String> verses = [];

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ShowSuraDetalisArg;

    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return verses.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Stack(children: [
            Image.asset(
              "assets/images/background_light.png",
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
            //      height: MediaQuery.of(context).size.height * 0.88,
                  child: ListView.separated(
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return ButAyaNumber(index: index,verses: verses[index]);
                      },
                      separatorBuilder: (context, index) => Divider(
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
    });
  }
}

class ShowSuraDetalisArg {
  String Name;
  int index;

  ShowSuraDetalisArg({required this.Name, required this.index});
}
