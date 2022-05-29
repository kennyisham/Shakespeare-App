import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class MorePage extends StatelessWidget {
  MorePage({Key? key}) : super(key: key);
  //set background
  String bgImage = 'app_background.png';
  static const scanData =
      '''Many of the suggested pronunciations in this dictionary are influenced by Shakespeare's use of iambic pentameter, which was the staple of English poetry from the time of Chaucer until the turn of the last century when free verse (that is, verse written outside of a metrical form) came into play. The verse form and the pronunciation of the Shakespearean vocabulary are intertwined. Shakespeare's verse often demands specific pronunciations, some of which are different than those used in colloquial speech. Pronunciations that respect the verse form can assist the actor not only with meaning and syntax but with acting intentions and emotional clarity.

 Beginning students often ask how verse differs from prose. A short answer is that prose follows the rules of grammar, while verse obeys not only grammar but also additional principles, which serve to heighten our attention to the rhythm of the language. A line of iambic pentameter verse, indicated in print by its layout on the page, adheres to a set of metrical principles. An iamb is composed of two syllables, the first unstressed, the second stressed. This is called an iambic foot. A foot is merely a theoretical division of a verse line. Metrical refers to meter. Meter is the organization of the regularity of speech into a strict pattern that can be identified and counted. Pentameter means that there are five metrical units in each line of verse, since penta is the Greek word for five. Therefore, iambic pentameter is a line of five iambic feet, which contains ten syllables. For example:"

  There is no virtue like necessity.

  Richard II I, 3, 278''';

  static const accentData =
      '''In some plays, accents are required of characters whose native language is not English. This occurs in both The Merry Wives of Windsor and Henry V. In the former, Dr. Caius, the physician, speaks English with a French accent and Hugh Evans, the schoolmaster, speaks English with a Welsh accent.

The different accents of the four captains in Henry V illuminate a central theme in the play. Fluellen, the second largest part, speaks with a Welsh accent. The printed text indicates the use of an Irish accent for MacMorris with the substitution of ish for is and Chrish for Christ, and a Scottish accent for Jamy with the repetition of gud for good. The text also indicates the use of sal/ for shall and the substitution of ay for I. If actors adopt the suggested nationalist accents for these characters, the question then is raised as to what to do with the speech of Gower, the Englishman. We would suggest that, in this one instance, an exception be made to our preference for American speech. The use of an English accent for Gower can accentuate the linguistic differences amongst the characters and point up the competing regional or national interests in both Shakespeare's and Henry's Britain, as well as reflect those of our own world.

The different accents of the four captains in Henry V illuminate a central theme in the play. Fluellen, the second largest part, speaks with a Welsh accent. The printed text indicates the use of an Irish accent for MacMorris with the substitution of ish for is and Chrish for Christ, and a Scottish accent for Jamy with the repetition of gud for good. The text also indicates the use of sal/ for shall and the substitution of ay for I. If actors adopt the suggested nationalist accents for these characters, the question then is raised as to what to do with the speech of Gower, the Englishman. We would suggest that, in this one instance, an exception be made to our preference for American speech. The use of an English accent for Gower can accentuate the linguistic differences amongst the characters and point up the competing regional or national interests in both Shakespeare's and Henry's Britain, as well as reflect those of our own world.

In Henry V, both Katherine and Alice speak English with a French accent that is indicated with the substitution of d for th and wat for what. In turn, Henry's attempt to address Katherine in her native tongue provokes laughter on her part. There is no indication in the text about the accuracy of the Boy's French accent as he interprets between Pistol and the French soldier. However, he does seem to have achieved a basic familiarity with the language while on campaign.

In Henry IV Part One, there is no orthographic suggestion as to the adoption of an accent for the part of Glendower. An accent might be employed to excellent effect considering that he is a native speaker of Welsh. In addition, Hotspur seems to insult Glendower with the gibe that "no man speaks better Welsh." Productions have sometimes used a trace of a Spanish accent for Katherine in Henry VIII, and a French accent for the Queen in Richard II and for Margaret in the Henry VI trilogy.

The text of King Lear calls for a Somersetshire dialect when Edgar confronts Oswald. The text indicates this with the substitution of z's for s's and v's for fs among others. It is best learned from a native speaker or from a dialect CD.

Questions often arise as to the efficacy of a dialect in the portrayal of the rustic or lower class characters. Our preference is for the use of American speech rather than stage Cockney or generic lower-class English speech. A wide variety of American regional dialects is available. Their usefulness will depend on the setting and location of the stage action.''';

  static const wordsData =
      '''This section offers brief observations on the poetic diction of each play. Each entry notes the percentage of prose and/or verse in a given play, as well as the amount of rhyming verse, if significant. It also includes a sampling of contractions and of words that expand to fulfill the demands of the meter. Examples of words that require an unusual stress on either their first or second syllables follow. For example, revenue is pronounced today with a stress on its first syllable but often requires a stress on its second syllable in Shakespeare. We direct readers to the appropriate sections for accents, dialects, foreign languages, Latin, and words that might present unforeseen difficulty.''';

  static const refData =
      '''Abbott, E. A. A Shakespearian Grammar. New York: Dover Publications, 1966.

The American Heritage Dictionary of the English Language, 3rd Edition. Boston: Houghton Mifflin, 1992

Allen, W. Sidney.Vax Latina. Cambridge: Cambridge

Attridge, Derek. Poetic Rhythm: An Introduction. Cambridge: Cambridge 1995.

Barton, John. Playing Shakespeare. London and New

Berry, Cicely. The Actor and the Text. New York: Applause, 1992.

Text in Action. London: Virgin Publishing, 2001.

Cercignani, Fausto. Shakespeare’s Words and Elizabethan Pronunciation. Oxford: Clarendon Press, 1981.

Colaianni, Louis. Shakespeare’s Names: A New Pronouncing Dictionary. New York: Quite Specific Media Group, 1999.

Coye, Dale F. Pronouncing Shakespeare’s Words. Westport, Conn.: Greenwood Press, 1998.

Crystal, David and Crystal, Ben. Shakespeare’s Words. Penguin Press, 2002

Dobson, E. J. English Pronunciation,1500-1700. 2 vols. Oxford: Clarendon Press, 1968.

Ehrlich, Eugene. Amo, Amas, Amat and More: How to Use Latin to Your Own Advantage and to the Astonishment of Others. New York: Harper & Row, 1985.

Irvine, Theodora Ursula. How to Pronounce the Names in Shakespeare. Ann Arbor, Michigan: Gryphon Books, 1971.

Jones, Daniel. English Pronouncing Dictionary, 15th Edition. Edited by Peter Roach and James Hartmann. Cambridge: Cambridge University Press, 1997.

Everyman’s English Pronouncing Dictionary. Extensively revised and edited by A.C. Gimson. London and Melbourne: J.M. Dent & Sons, 1986.

Kermode, Frank. Shakespeare’s Language. New York: Farrar, Straus and Giroux, 2001.

Kokeritz, Helge. Shakespeare’s Names: A Pronouncing Dictionary. New Haven: Yale University Press, 1959.

Shakespeare’s Pronunciation. New Haven: Yale University Press, 1953.

McDonald, Russ. The Bedford Companion to Shakespeare. Boston and New York: Bedford Books of St. Martin’s Press, 1996.

McLean, Margaret Prendergast. Good American Speech. New York: E.P. Dutton and Co., 1946.

Merriam-Webster’s Collegiate Dictionary, 10th Edition. Springfield, Mass.: Merriam-Webster, 1993.

Morwood, James. A Dictionary of Latin Words and Phrases. Oxford and New York: Oxford University Press, 1998.

The Oxford English Dictionary, 2nd Edition. 20 vols. Oxford: Clarendon, 1989.

The Oxford Universal Dictionary, 3rd Edition. Oxford: Clarendon, 1944.

A Pronouncing Dictionary of American English. Editors John Samuel Kenyon and Thomas Albert Knott. Springfield, Mass.: G&C Merriam Co., 1953.

The Reader’s Encyclopedia of Shakespeare. Editors Oscar James Campbell and Edward G. Quinn. New York: MJF Books, 1966.

Reading Shakespeare’s Dramatic Language – A Guide. Editors Sylvia Adamson, Lynette Hunter, Lynne Magnusson, Ann Thompson, and Katie Wales. London: Thomson Learning, 2001.

Schmidt, Alexander. Shakespeare Lexicon and Quotation Dictionary. 2 Vols. New York: Dover Publications, 1971.

Shakespeare, William.The First Folio of Shakespeare 1623. Prepared and Introduced by Doug Maston. New York: Applause Books, 1995.

Shakespeare, William. William Shakespeare: The Complete Works. General Editor, Alfred Harbage. New York: The Viking Press, 1969.

Skinner, Edith. Speak With Distinction. Edited by Lilene Mansell. Revised by Timothy Monich and Lilene Mansell. New York: Applause, 1990.

Spain, Delbert. Shakespeare Sounded Soundly. Santa Barbara, California: Garland-Clarke Editions/Capra Press, 1988.

Tarlinskaja, Marina.Shakespeare’s Verse. New York: Peter Lang, 1987.

Webster’s Third New International Dictionary of the English Language. Springfield, Mass.: Merriam, 1961.

Wilkinson, L. P.Golden Latin Artistry. Cambridge: Cambridge University Press, 1963.

Wright, George T. Shakespeare’s Metrical Art. Berkeley, California: University of California Press, 1988.

Other editions of Shakespeare consulted include The Riverside Shakespeare and The Oxford Shakespeare, as well as individual volumes in the following series: The Arden, Folger, Kittredge, New American Library, The New Cambridge, New Clarendon, New Penguin, and New Swan.''';

  final List<Item> items = [
    Item(header: 'Scanning the Verse', body: scanData),
    Item(header: 'Accents, Dialects and Foreign Languages', body: accentData),
    Item(header: 'Words to Watch Out For', body: wordsData),
    Item(header: 'References', body: refData),
  ];

  @override
  Widget build(BuildContext context) => Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.fill,
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 5.0),
                  child: Text('More',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'georgia',
                          fontWeight: FontWeight.bold)),
                ),
                ExpansionPanelList.radio(
                  children: items
                      .map((item) => ExpansionPanelRadio(
                            backgroundColor: Colors.transparent,
                            canTapOnHeader: true,
                            value: item.header,
                            headerBuilder: (context, isExpanded) => Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/panel_background.png'),
                                fit: BoxFit.cover,
                              )),
                              child: ListTile(
                                title: Text(
                                  item.header,
                                  style: const TextStyle(
                                      fontSize: 20, fontFamily: 'georgia'),
                                ),
                              ),
                            ),
                            body: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    item.body,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'georgia',
                                        wordSpacing: 3,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        )
      ]);
}

class Item {
  final String header;
  final String body;

  Item({
    required this.header,
    required this.body,
  });
}
