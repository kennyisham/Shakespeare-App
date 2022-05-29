import 'package:flutter/material.dart';
//import 'package:nestednav/home_page.dart';
import 'package:nestednav/pages/database_helper.dart';
import 'package:auto_route/auto_route.dart';
//import 'package:nestednav/pages/more.dart';
import 'package:nestednav/routes/router.gr.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List alphabets = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  List wordItems = [];
  List latinWordItems = [];

  DatabaseHelper dbHelper = DatabaseHelper.instance;

  void loadWordsFromDB() async {
    List test = [];

    //DatabaseHelper dbHelper = DatabaseHelper.instance;
    //await dbHelper.getAllWhere("wordmaster","where word like 'a%'").then((rows){
    await dbHelper.getAll("wordmaster").then((rows) {
      test = rows;
      for (int x = 0; x < alphabets.length; x++) {
        List result = test
            .where((element) =>
                element['Word'][0].toLowerCase().startsWith(alphabets[x]))
            .toList();
        wordItems.add(alphabets[x].toUpperCase());
        for (int i = 0; i < result.length; i++) {
          wordItems.add(result[i]);
          test.remove(result[i]);
        }
      }
    });
  }

  void loadLatinWordsFromDB() async {
    List test = [];

    await dbHelper.getAll("wordlatin").then((rows) {
      for (int i = 0; i < rows.length; i++) {
        latinWordItems.add(rows[i]);
      }
      //print('Latin word count = ' + latinWordItems.length.toString());
    });
  }

  void delayLoading() async {
    await Future.delayed(const Duration(seconds: 5), () {
      context.replaceRoute(
          HomeRouter(wordItems: wordItems, latinwordItems: latinWordItems));
      /*
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'wordList': wordItems,
        'latinWordList': latinWordItems,
      });
      */
    });
  }

  @override
  void initState() {
    super.initState();
    loadWordsFromDB();
    loadLatinWordsFromDB();
    delayLoading();
  }

  @override
  Widget build(BuildContext context) {
    //set background
    String bgImage = 'app_background.png';
    //Color? bgColor = Colors.blue;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Shakespeare',
                    style: TextStyle(
                      fontSize: 65.0,
                      fontFamily: 'georgia',
                      //fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 1.0),
              const Text(
                'PRONUNCIATION',
                style: TextStyle(
                  fontSize: 42.0,
                  fontFamily: 'georgia',
                  //letterSpacing: -1.0
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset('assets/images/speaker_icon.png'),
              const SizedBox(height: 150.0),
              const Text(
                'A COMPLETE AUDIO',
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Myriad Pro',
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.0),
              ),
              const SizedBox(height: 3.0),
              const Text(
                'PRONUNCIATION DICTIONARY',
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Myriad Pro',
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.0),
              ),
              const SizedBox(height: 3.0),
              const Text(
                'FOR THE PLAYS OF',
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Myriad Pro',
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.0),
              ),
              const SizedBox(height: 3.0),
              const Text(
                'WILLIAM SHAKESPEARE',
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Myriad Pro',
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.0),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    "LOUIS SCHEEDER AND SHANE ANN YOUNTS",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Myriad Pro",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: -1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
