import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AuthorTile extends StatelessWidget {
  const AuthorTile({Key? key, required this.title, required this.subTitle, required this.leadingImage, required this.color}) : super(key: key);

  final String title;
  final String subTitle;
  final Widget leadingImage;
  final Color color;

  final String bgImage = 'app_background.png';

  //ListTile({this.title, this.subTitle, this.trailingImage, this.leadingImage, this.color, this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Card(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/$bgImage'),
                fit: BoxFit.fill,
              )),
/*
              child: HtmlWidget(subTitle,
                //style: TextStyle(fontSize: 10,)
              ),
*/
              child: ListTile(
                tileColor: Colors.black12,

                //title: Text('Louis Scheeder'),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 125.0, 5.0, 5.0),
                  child: HtmlWidget(
                    subTitle,
                    textStyle: const TextStyle(
                        fontFamily: 'georgia', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              child: leadingImage,
            ),
          ),
        ],
      ),
    );
  }
}
