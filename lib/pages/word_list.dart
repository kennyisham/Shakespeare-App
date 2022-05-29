//import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nestednav/routes/router.gr.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WordListPage extends StatefulWidget {
  const WordListPage(
      {Key? key,
      @PathParam() required this.words,
      @PathParam() required this.letter})
      : super(key: key);

  final words;
  final String letter;

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  final itemKey = GlobalKey();
  final itemController = ItemScrollController();
  final itemController2 = ItemScrollController();
  List wordItems = [];
  String Letter = "";
  List<String> alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  int _selectedIndex = 0;

/*
  _WordListPageState(List words, String letter){
    wordItems = words;
    Letter = letter;
    print('In words page - ' + Letter);
  }
*/

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => scrollToIndex(_selectedIndex));
  }

  Future scrollToItem(ind) async {
    itemController.jumpTo(index: ind);
  }

  @override
  Widget build(BuildContext context) {
    wordItems = widget.words;
    Letter = widget.letter;

    String bgImage = 'app_background.png';

    _selectedIndex = wordItems.indexWhere((element) => element == Letter);

    return Scaffold(
/*
        appBar: AppBar(
          backgroundColor: const Color(0xffbea382),
          foregroundColor: const Color(0xff8b0000),
          toolbarHeight: 40,
        ),
*/
        body: SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 76,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: FloatingSearchBarScrollNotifier(
                child: ScrollablePositionedList.builder(
                  itemCount: wordItems.length,
                  itemBuilder: (context, index) => buildCard(index),
                  itemScrollController: itemController,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
            //preferredSize: const Size.fromWidth(20.0),
            child: Center(
              child: Container(
                width: 20,
                color: const Color(0xffbea382),
                child: ScrollablePositionedList.builder(
                  itemCount: alphabets.length,
                  itemBuilder: (context, index) => buildSideMenuCard(index),
                  itemScrollController: itemController2,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  buildCard(int index) => SizedBox(
        //color: Colors.grey,
        height: 40,
        child: Card(
          color: Colors.transparent,
          shadowColor: wordItems[index].length == 1 ? null : Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: wordItems[index].length != 1
                  ? ElevatedButton(
                      onPressed: () {
                        context.router
                            .push(WordInfoRoute(wordItem: wordItems[index]));

                        /*
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    WordInfo(wordItem: wordItems[index]),
              ),
            );
            */
                      },
                      child: Text(
                        //'$index',
                        wordItems[index].length == 1
                            ? wordItems[index]
                            : wordItems[index]['Word'],
                        style: wordItems[index].length == 1
                            ? const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'georgia',
                              )
                            : const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'georgia'),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.transparent,
                        alignment: Alignment.topLeft,
                      ),
                    )
                  : Text(
                      //'$index',
                      wordItems[index].length == 1
                          ? wordItems[index]
                          : wordItems[index]['Word'],
                      style: wordItems[index].length == 1
                          ? const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'georgia')
                          : const TextStyle(
                              fontSize: 20, fontFamily: 'georgia'),
                    )),
        ),
      );

  Future scrollToIndex(int index, {bool isAnimating = false}) async {
    const double alignment = 0;

    if (isAnimating) {
      await itemController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        alignment: alignment,
      );
    } else {
      itemController.jumpTo(index: index, alignment: alignment);
    }
  }

  buildSideMenuCard(int index) => SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 15, height: 15),
            child: Center(
              child: InkWell(
                onTap: () {
                  scrollToIndex(wordItems
                      .indexWhere((element) => element == alphabets[index]));
                },
                child: Text(
                  alphabets[index],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
}
