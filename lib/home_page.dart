import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nestednav/pages/searchDelegate.dart';
//import 'package:nestednav/pages/database_helper.dart';
import 'package:nestednav/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var latinwordItems;

  HomePage(
      {Key? key,
      @PathParam() required this.wordItems,
      @PathParam() required this.latinwordItems})
      : super(key: key);

  //final List alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
  var wordItems;
  //final latinWordItems;

  List words = [];

  Future<void> _showSearch(BuildContext context) async {
    final searchText = await showSearch<String>(
        context: context,
        delegate: SearchWithSuggestionDelegate(
          wordItems,
          onSearchChanged: _getRecentSearchesLike,
          searchFieldLabel: "",
        ));

    //print(searchText.toString() + ' This is search text.');
    //Save the searchText to SharedPref so that next time you can use them as recent searches.
    await _saveToRecentSearches(searchText!);

    //print('Words cnt is ' + wordItems.length.toString());

    List items = words.where((element) => element.length > 1).toList();

    //print('Items cnt is ' + items.length.toString());

    final suggestions = items.where((word) {
      return word['Word'].toString().toLowerCase() ==
          (searchText.toLowerCase());
    });

    //print('suggestions is ' + suggestions.elementAt(0)['Word']);

    if (suggestions.isNotEmpty) {
      //print('suggestions is ' + suggestions.elementAt(0));

      AutoRouter.of(context).push(HomeRouter(children: [
        WordsRouter(
            children: [WordInfoRoute(wordItem: suggestions.elementAt(0))])
      ], wordItems: wordItems, latinwordItems: latinwordItems));

      //context.router.push(WordInfoRoute(wordItem: suggestions.elementAt(0)));
    }
    /*
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            WordInfo(wordItem: suggestions.elementAt(0)),
      ),
    );
    */

/*
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            //title: Text(suggestion),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      WordInfo(wordItem: suggestions.elementAt(index)),
                ),
              );
            },
            title: Text(
                suggestions.elementAt(index)['Word']
            ),
          );
        }
    );
*/

    //Do something with searchText. Note: This is not a result.
  }

  Future<List<String>> _getRecentSearchesLike(String query) async {
    final pref = await SharedPreferences.getInstance();
    final allSearches = pref.getStringList("recentSearches");
    return allSearches!.where((search) => search.startsWith(query)).toList();
  }

  Future<void> _saveToRecentSearches(String searchText) async {
    if (searchText == '') return; //Should not be null

    //print('This is search word $searchText');
    final pref = await SharedPreferences.getInstance();

    //Use `Set` to avoid duplication of recentSearches
    Set<String> allSearches =
        pref.getStringList("recentSearches")?.toSet() ?? {};

    //Place it at first in the set
    allSearches = {searchText, ...allSearches};
    pref.setStringList("recentSearches", allSearches.toList());
  }

/*
  final DatabaseHelper dbHelper = DatabaseHelper.instance;


  void loadWordsFromDB() async {
    List test = [];

    //DatabaseHelper dbHelper = DatabaseHelper.instance;
    //await dbHelper.getAllWhere("wordmaster","where word like 'a%'").then((rows){
    await dbHelper.getAll("wordmaster").then((rows){
      test = rows;
      for(int x=0;x<alphabets.length;x++){
        List result = test.where((element) => element['Word'][0].toLowerCase().startsWith(alphabets[x])).toList();
        wordItems.add(alphabets[x].toUpperCase());
        for(int i=0;i<result.length;i++) {
          wordItems.add(result[i]);
          test.remove(result[i]);
        }
      }
    });
  }

  void loadLatinWordsFromDB() async {
    await dbHelper.getAll("wordlatin").then((rows) {
      for (int i = 0; i < rows.length; i++) {
        latinWordItems.add(rows[i]);
      }
      //print('Latin word count = ' + latinWordItems.length.toString());
    });
  }

*/

  @override
  Widget build(BuildContext context) {
    //print(wordItems.length);
    words = wordItems as List;

    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: const Color(0xffbea382),
        title: const Center(
          child: Text('Search',
              style: TextStyle(
                color: Color(0xff8b0000),
              )),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xff8b0000),
              ),
              onPressed: () => _showSearch(context)),
        ],
        foregroundColor:
            const Color(0xff8b0000), //title: const Text('FlutterBottomNav'),
        //centerTitle: true,
        leading: const AutoBackButton(),
      ),
      routes: const [
        WordsRouter(),
        MoreRouter(),
        AboutRouter(),
        ShareRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          //onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: const Color(0xffbea382),
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/book.png"),
                color: Color(0xff8b0000),
              ),
              label: 'WORDS',
              //backgroundColor: Color(0xffbea382),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/more.png"),
                color: Color(0xff8b0000),
              ),
              label: 'MORE',
              //backgroundColor: Color(0xffbea382),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/about.png"),
                color: Color(0xff8b0000),
              ),
              label: 'ABOUT',
              //backgroundColor: Color(0xffbea382),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/share.png"),
                color: Color(0xff8b0000),
              ),
              label: 'SHARE',
              //backgroundColor: Color(0xffbea382),
            ),
          ],
        );
/*         return SalomonBottomBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/images/book.png"),
                  color: Color(0xff8b0000),
                ),
                title: const Text('Words')),
            SalomonBottomBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/images/more.png"),
                  color: Color(0xff8b0000),
                ),
                title: const Text('More')),
            SalomonBottomBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/images/about.png"),
                  color: Color(0xff8b0000),
                ),
                title: const Text('About')),
            SalomonBottomBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/images/share.png"),
                  color: Color(0xff8b0000),
                ),
                title: const Text('Share'))
          ],
        );
 */
      },
    );
  }
}
