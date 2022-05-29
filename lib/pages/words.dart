//import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nestednav/pages/routedata.dart';
import 'package:nestednav/pages/stacked_images.dart';
import 'package:nestednav/pages/word_list.dart';
import 'package:nestednav/routes/router.gr.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({Key? key}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  //final words;
  // ignore: prefer_typing_uninitialized_variables
  //final latinwords;

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  //set background
  String bgImage = 'app_background.png';
  int currentIndex = 0;

  //Map data = {};

  @override
  Widget build(BuildContext context) {
    //final fsb = FloatingSearchBar.of(context);

    final List wordList =
        context.tabsRouter.routeData.pathParams.get('wordItems');
    final List latinwordList =
        context.tabsRouter.routeData.pathParams.get('latinwordItems');
    //final List<RouteData> wordList = ModalRoute.of(context)!.settings.arguments as List<RouteData>;
    //data = ModalRoute.of(context)?.settings?.arguments as Map;

    //print(wordList[0].wordList.length);
    //print(wordList[0].latinWordList.length);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildExpandedBox(
                color: Colors.transparent,
                children: [
                  buildLetterImages(
                      context,
                      [
                        'assets/images/A.png',
                        'assets/images/B.png',
                        'assets/images/C.png',
                        'assets/images/D.png',
                        'assets/images/E.png'
                      ],
                      'assets/images/BoxContainer1.png',
                      wordList),
                ],
              ),
              buildExpandedBox(color: Colors.transparent, children: [
                buildLetterImages(
                    context,
                    [
                      'assets/images/F.png',
                      'assets/images/G.png',
                      'assets/images/H.png',
                      'assets/images/I.png',
                      'assets/images/J.png'
                    ],
                    'assets/images/BoxContainer1.png',
                    wordList),
              ]),
              buildExpandedBox(color: Colors.transparent, children: [
                buildLetterImages(
                    context,
                    [
                      'assets/images/K.png',
                      'assets/images/L.png',
                      'assets/images/M.png',
                      'assets/images/N.png',
                      'assets/images/O.png'
                    ],
                    'assets/images/BoxContainer1.png',
                    wordList),
              ]),
              buildExpandedBox(color: Colors.transparent, children: [
                buildLetterImages(
                    context,
                    [
                      'assets/images/P.png',
                      'assets/images/Q.png',
                      'assets/images/R.png',
                      'assets/images/S.png',
                      'assets/images/T.png'
                    ],
                    'assets/images/BoxContainer1.png',
                    wordList),
              ]),
              buildExpandedBox(color: Colors.transparent, children: [
                buildLetterImages(
                    context,
                    [
                      'assets/images/U.png',
                      'assets/images/V.png',
                      'assets/images/W.png',
                      'assets/images/X.png',
                      'assets/images/Y.png'
                    ],
                    'assets/images/BoxContainer1.png',
                    wordList),
              ]),
              buildLeftExpandedBox(color: Colors.transparent, children: [
                buildLetterImages(context, ['assets/images/Z.png'],
                    'assets/images/BoxContainer1.png', wordList),
                buildLatinImages(context, ['assets/images/Latin.png'],
                    'assets/images/BoxContainer2.png', latinwordList)
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildExpandedBox({
  required List<Widget> children,
  required Color color,
}) =>
    Expanded(
      child: Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );

Widget buildLeftExpandedBox({
  required List<Widget> children,
  required Color color,
}) =>
    Expanded(
      child: Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(right: 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );

Widget buildLetterImages(
    BuildContext context, List<String> images, boxImage, List words) {
  const double size = 75;

  final items = images
      .map((image) => buildImage(context, image, boxImage,
          image.substring(image.length - 5, image.length - 4), words))
      .toList();
  //final items = buildImage(image);

  return StackedWidgets(
    items: items,
    size: size,
  );
}

Widget buildLatinImages(
    BuildContext context, List<String> images, boxImage, List latinwords) {
  const double size = 150;

  final items = images
      .map((image) => buildLatinImage(context, image, boxImage, latinwords))
      .toList();
  //final items = buildImage(image);

  return StackedWidgets(
    items: items,
    size: size,
  );
}

Widget buildImage(
    BuildContext context, String image, String box, String letter, List words) {
  //Map data = ModalRoute.of(context)?.settings?.arguments as Map;

  return Stack(
      //overflow: Overflow.visible,
      children: [
        Positioned(
          left: 3,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(box),
                fit: BoxFit.cover,
              ),
              //color: Colors.green,
            ),
            //alignment: Alignment.bottomCenter,
            width: 65,
            height: 65,
          ),
        ),
        Positioned(
          top: 10,
          right: 13,
          child: IconButton(
            icon: Image.asset(image),
            onPressed: () {
              context.router.push(WordListRoute(words: words, letter: letter));

              /*
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                        WordListPage(words: words,letter: letter,),
                  ),
              );
              */
            },
          ),
        ),
      ]);
}

Widget buildLatinImage(
    BuildContext context, String image, String box, List latinwords) {
  return Stack(
      //overflow: Overflow.visible,
      children: [
        Positioned(
          left: -3,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(box),
                //fit: BoxFit.cover,
              ),
              //color: Colors.green,
            ),
            //alignment: Alignment.bottomCenter,
            width: 150,
            height: 65,
          ),
        ),
        Positioned(
          top: -25,
          right: 15,
          child: IconButton(
            icon: Image.asset(image),
            iconSize: 100.0,
            onPressed: () {
              context.router.push(LatinWordListRoute(latinwords: latinwords));
              /*
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      LatinWordList(latinwords: latinwords),
                ),
              );
              */
            },
          ),
        ),
      ]);
}
