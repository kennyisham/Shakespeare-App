//import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nestednav/pages/latin_overview.dart';
import 'package:nestednav/routes/router.gr.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LatinWordListPage extends StatefulWidget {
  const LatinWordListPage({Key? key, @PathParam() required this.latinwords})
      : super(key: key);

  final latinwords;

  @override
  State<LatinWordListPage> createState() => _LatinWordListState();
}

class _LatinWordListState extends State<LatinWordListPage>
    with TickerProviderStateMixin {
  final itemController = ItemScrollController();

  List wordItems = [];
  String bgImage = 'app_background.png';

/*
  _LatinWordListState(List words){
    wordItems = words;
    print(wordItems.length);
  }
*/

  @override
  Widget build(BuildContext context) {
    wordItems = widget.latinwords;

    TabController _controller = TabController(length: 2, vsync: this);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/$bgImage'),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        controller: _controller,
                        indicatorColor: const Color(0xff8b0000),
                        tabs: const [
                          Tab(
                            child: Text(
                              "Words",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'georgia',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'georgia',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        //width: double.maxFinite,
                        //height: double.maxFinite,
                        child: TabBarView(
                          controller: _controller,
                          children: [
                            ScrollablePositionedList.builder(
                              itemCount: wordItems.length,
                              itemBuilder: (context, index) => buildCard(index),
                              itemScrollController: itemController,
                            ),
                            const SingleChildScrollView(
                                //physics: NeverScrollableScrollPhysics(),
                                child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: LatinOverview(),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  buildCard(int index) => SizedBox(
        //color: Colors.grey,
        height: 35,
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: ElevatedButton(
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
                  wordItems[index]['Word'],
                  style: const TextStyle(
                      fontSize: 17, color: Colors.black, fontFamily: 'georgia'),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                  alignment: Alignment.topLeft,
                ),
              )),
        ),
      );
}
