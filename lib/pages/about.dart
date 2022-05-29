import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestednav/pages/authorTile.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  //set background
  String bgImage = 'app_background.png';

  String textFromFile = 'Empty';
  String louisData = 'Empty';
  String shaneAnnData = 'Empty';

  getLouisData() async {
    String response;
    response = await rootBundle.loadString('assets/text/louis_scheeder.txt');
    setState(() {
      louisData = response;
    });
  }

  getShaneData() async {
    String response;
    response = await rootBundle.loadString('assets/text/shane_ann_younts.txt');
    setState(() {
      shaneAnnData = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    getLouisData();
    getShaneData();

    List<Item> items = [
      Item(
          header: 'LOUIS SCHEEDER',
          body: louisData,
          image: 'assets/images/Louis_Scheeder.jpg'),
      Item(
          header: 'SHANE ANN YOUNTS',
          body: shaneAnnData,
          image: 'assets/images/Shane_Ann_Younts.jpg'),
      //Item(header: 'Accents, Dialects and Foreign Languages', body: accentData),
    ];

    return Stack(children: [
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
                child: Text('About',
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
                          body: AuthorTile(
                            title: 'title',
                            subTitle: item.body,
                            color: Colors.transparent,
                            leadingImage: Image.asset(item.image, height: 100),
                          ),
                          /*
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(""),
        
                                  child: HtmlWidget(
                                    item.body,
                                  ),
                                ),
                              ),
        */
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class Item {
  final String header;
  String body;
  final String image;

  Item({required this.header, required this.body, required this.image});
}
