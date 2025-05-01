import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/taps/hadeth_tap/show_hadeth_details.dart';

class Hadeth_tap extends StatefulWidget {
  @override
  State<Hadeth_tap> createState() => _Hadeth_tapState();
}

class _Hadeth_tapState extends State<Hadeth_tap> {
  List<Hadeth> allhades = [];

  @override
  Widget build(BuildContext context) {
    if (allhades.isEmpty) {
      loadHadethes();
    }

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            "assets/images/hadeth_image.png",
            fit: BoxFit.fill,
          ),
          const Divider(
            thickness: 2,
          ),
          Text(AppLocalizations.of(context)!.hadithNameTitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ShowHadethDetails.routeName,
                        arguments: Hadeth(
                            title: allhades[index].title,
                            content: allhades[index].content)),
                    child: Text(
                      allhades[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      thickness: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                itemCount: allhades.length),
          )
        ],
      ),
    );
  }

  loadHadethes() async {
    String loadedData = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadethList = loadedData.split('#\r\n');

    for (int i = 0; i < allHadethList.length; i++) {
      List<String> singleHadeth = allHadethList[i].split('\n');
      String title = singleHadeth[0];
      singleHadeth.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: singleHadeth);
      allhades.add(hadeth);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.content, required this.title});
}
