import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LatinOverview extends StatefulWidget {
  const LatinOverview({Key? key}) : super(key: key);

  @override
  State<LatinOverview> createState() => _LatinOverviewState();
}

class _LatinOverviewState extends State<LatinOverview> {
  //set background
  String bgImage = 'app_background.png';

  String textFromFile = 'Empty';

  getOverviewData() async {
    String response;
    response = await rootBundle.loadString('assets/text/latin_overview.txt');
    setState(() {
      textFromFile = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getOverviewData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HtmlWidget(
        textFromFile,
        textStyle: const TextStyle(
            fontSize: 13,
            fontFamily: 'georgia',
            fontWeight: FontWeight.bold,
            wordSpacing: 3),
      ),
    );
  }
}
