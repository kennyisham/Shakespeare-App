import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  String bgImage = 'app_background.png';
  String textFromFile = 'Empty';

  getData() async {
    String response;
    response = await rootBundle.loadString('assets/text/play2.txt');

    setState(() {
      textFromFile = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    //print('I am in play');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffbea382),
          toolbarHeight: 40,
        ),
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$bgImage'),
                    fit: BoxFit.cover,
                  )
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(
                      textFromFile,
                  ),
                ),
              ),
            )
        )
    );
  }
}
