// ignore: file_names
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nestednav/routes/router.gr.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class SearchWithSuggestionDelegate extends SearchDelegate<String> {
  ///[onSearchChanged] gets the [query] as an argument. Then this callback
  ///should process [query] then return an [List<String>] as suggestions.
  ///Since its returns a [Future] you get suggestions from server too.
  final OnSearchChanged onSearchChanged;

  ///This [_oldFilters] used to store the previous suggestions. While waiting
  ///for [onSearchChanged] to completed, [_oldFilters] are displayed.
  List<String> _oldFilters = const [];

  SearchWithSuggestionDelegate(this.words,
      {required String searchFieldLabel, required this.onSearchChanged})
      : super(searchFieldLabel: searchFieldLabel);

  List<String> searchResults = [];
  List item = [];
  final List words;

  //MySearchDelegate(this.words);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Color(0xff8b0000),
          ),
          onPressed: () {
            if (query.isEmpty) {
              close(context, "");
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xff8b0000),
        ),
        onPressed: () => Navigator.pop(context), //close searchBar
      );

  @override
  Widget buildResults(BuildContext context) {
    //print('I am here');
    if (query.isEmpty) return buildNoSuggestions();

    List items = words.where((element) => element.length > 1).toList();

    final suggestions = items.where((word) {
      return word['Word'].toString().toLowerCase() == (query.toLowerCase());
    });

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            //title: Text(suggestion),
            onTap: () {
              /*
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        WordInfo(wordItem: suggestions.elementAt(index)),
                  ),
              );
              */
              context.router
                  .push(WordInfoRoute(wordItem: suggestions.elementAt(index)));
            },
            title: Text(suggestions.elementAt(index)['Word']),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return buildNoSuggestions();

    List items = words.where((element) => element.length > 1).toList();

    final suggestions = items.where((word) {
      return word['Word']
          .toString()
          .toLowerCase()
          .startsWith(query.toLowerCase());
    });

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          final suggestion = suggestions.elementAt(index)['Word'];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);
          return ListTile(
            //title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                  text: queryText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                        text: remainingText,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        )),
                  ]),
            ),
            onTap: () {
              query = suggestion;
              //print(query);
              showResults(context);
            },
          );
        });
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          return ListTile(
            //title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                  text: queryText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                        text: remainingText,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        )),
                  ]),
            ),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        },
      );

  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  Widget buildNoSuggestions() {
    return FutureBuilder<List<String>>(
      future: onSearchChanged != null ? onSearchChanged(query) : null,
      builder: (context, snapshot) {
        if (snapshot.hasData) _oldFilters = snapshot.data!;
        return ListView.builder(
          itemCount: _oldFilters.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.restore),
              title: Text("${_oldFilters[index]}"),
              onTap: () {
                query = _oldFilters[index];
                //print(query);
                showResults(context);
              },
              //onTap: () => close(context, _oldFilters[index]),
            );
          },
        );
      },
    );

/*
    String bgImage = 'app_background.png';

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.cover,
          )
      ),
      child: const Center(
        child: Text(
          'No Suggestions!',
          style: TextStyle(fontSize: 28, color: Color(0xff8b0000)),
        ),
      ),
    );
*/
  }
}
