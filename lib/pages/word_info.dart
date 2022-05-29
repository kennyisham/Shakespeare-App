import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nestednav/pages/app_large_text.dart';
import 'package:nestednav/pages/play_abbreviations.dart';
import 'package:nestednav/pages/word_pronunciation.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'app_text.dart';

class WordInfoPage extends StatelessWidget {
  const WordInfoPage({Key? key,
    @PathParam() required this.wordItem}) : super(key: key);

  final  wordItem;


  _searchWordBuild(String word){

    String something = word;
    List<TextSpan> newList = [];
    String newWord = "";

    while (something.length > 1) {
      int up_finder = something.toString().indexOf("^");
      int pound_finder = something.toString().indexOf("#");
      int star_finder = something.toString().indexOf("*");

      List numbers = [up_finder, pound_finder, star_finder];


      print('Up: $up_finder');
      print('Pound: $pound_finder');
      print('Star: $star_finder');

      //something = "";

      if (up_finder == -1 && pound_finder == -1 && star_finder == -1){
        print('We are in -1');
        newList.add(new TextSpan(
            text: something.toString(),
            style: const TextStyle(fontFamily: 'georgia')));

        something = "";

        break;
      }else if ((up_finder < pound_finder || pound_finder == -1) && (up_finder < star_finder || star_finder == -1) && up_finder > -1) {
        print('We are in UP');

        newList.add(new TextSpan(
            text: something.toString().substring(0, up_finder),
            style: const TextStyle(fontFamily: 'georgia')));
        something = something.toString().substring(up_finder + 1);
        int finder2 = something.toString().indexOf("^");
        //if (finder2 > -1) {
        newList.add(new TextSpan(
            text: something.toString().substring(0, finder2),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'georgia')));
        //newWord = newWord + something.toString().substring(0, finder2);
        something = something.toString().substring(finder2 + 1);
        //}
      }else if((pound_finder < up_finder || up_finder == -1) && (pound_finder < star_finder || star_finder == -1) && pound_finder > -1){
        print('We are in POUND');

        newList.add(new TextSpan(
              text: something.toString().substring(0, pound_finder),
              style: const TextStyle(fontFamily: 'Shakespeare')));
          something = something.toString().substring(pound_finder + 1);
          int finder2 = something.toString().indexOf("#");
          //if (finder2 > -1) {
          newList.add(new TextSpan(
              text: something.toString().substring(0, finder2),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Shakespeare')));
          //newWord = newWord + something.toString().substring(0, finder2);
          something = something.toString().substring(finder2 + 1);
          //}
      }
      else if((star_finder < up_finder || up_finder == -1) && (star_finder < pound_finder || pound_finder == -1) && star_finder > -1){
        print('We are in STAR');
          newList.add(new TextSpan(
              text: something.toString().substring(0, star_finder),
              style: const TextStyle(fontFamily: 'Shakespeare')));
          something = something.toString().substring(star_finder + 1);
          int finder2 = something.toString().indexOf("*");
          //if (finder2 > -1) {
          newList.add(new TextSpan(
              text: something.toString().substring(0, finder2),
              style: const TextStyle(
                  fontFamily: 'Shakespeare')));
          //newWord = newWord + something.toString().substring(0, finder2);
          something = something.toString().substring(finder2 + 1);
          //}
      }

    }

    return newList;
  }

  @override
  Widget build(BuildContext context) {
    String bgImage = 'app_background.png';

    AudioPlayer player = AudioPlayer();

    List<TextSpan> items = _searchWordBuild(wordItem['Respell'].toString());

/*
    List<TextSpan> items = [
     TextSpan(text: 'L', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'georgia')),
      TextSpan(text: 'O', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Shakespeare')),
      TextSpan(text: '-shuhs', style: const TextStyle(fontFamily: 'georgia')),
    ];
*/

    return Scaffold(
      /*
        appBar: AppBar(
          backgroundColor: const Color(0xffbea382),
          foregroundColor: const Color(0xff8b0000),
          toolbarHeight: 40,
        ),
        */
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$bgImage'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.black12,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 20),
                            child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppLargeText(
                                      text: wordItem['Word'],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    AppText(
                                      text: wordItem['WordLine2'] ?? "",
                                      size: wordItem['WordLine2'] == null
                                          ? 0
                                          : 15,
                                    ),
                                    SizedBox(
                                      height: wordItem['WordLine2'] == null
                                          ? 0
                                          : 15,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                        ),
                                        children: items,
                                      ),
                                    ),
                                    AppText(
                                      text: wordItem['ScansTo'] ?? "",
                                      size:
                                          wordItem['ScansTo'] == null ? 0 : 15,
                                    ),
                                    AppText(
                                      text: wordItem['ScansToExampleOrName'] ??
                                          "",
                                      size: wordItem['ScansToExampleOrName'] ==
                                              null
                                          ? 0
                                          : 15,
                                    ),
                                  ],
                                ),
                              ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    // for URL
                                    int result = await player.play("https://shakespearepronunciation.s3.amazonaws.com/audio/" + wordItem['MP3']);
/*
                                    // for local storage
                                    String audioasset = "assets/audio/a.mp3";
                                    ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
                                    Uint8List  soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                                    int result = await player.playBytes(soundbytes);
*/
                                    if(result == 1){ //play success
                                      print("Sound playing successful.");
                                    }else{
                                      print("Error while playing sound.");
                                    }
                                  },
                                  child: Image.asset('assets/images/speaker_icon.png', width: 40, height: 40,),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            AppText(text: wordItem['Example1'] ?? "",size: wordItem['Example1'] == null ? 0:15,),
                            AppText(text: wordItem['Example2'] ?? "",size: wordItem['Example2'] == null ? 0:15,),
                            AppText(text: wordItem['Example3'] ?? "",size: wordItem['Example3'] == null ? 0:15,),
                            AppText(text: wordItem['Example4'] ?? "",size: wordItem['Example4'] == null ? 0:15,),
                            AppText(text: wordItem['Example5'] ?? "",size: wordItem['Example5'] == null ? 0:15,),
                            AppText(text: wordItem['Example6'] ?? "",size: wordItem['Example6'] == null ? 0:15,),
                            AppText(text: wordItem['Example7'] ?? "",size: wordItem['Example7'] == null ? 0:15,),
                          ],
                        ),

                      )
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Text("Play Abbreviations", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black, fontFamily: "georgia", fontWeight: FontWeight.bold, fontSize: 16,)
                                  ),
                                  onTap: ()  {
                                    print("tapped");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Play(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Text("Word Pronunciation Key", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black, fontFamily: "georgia", fontWeight: FontWeight.bold, fontSize: 16,)
                                  ),
                                  onTap: ()  {
                                    print("tapped");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WordPronunciation(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  )
                ],
              )
            )
        )
    );
  }
}
