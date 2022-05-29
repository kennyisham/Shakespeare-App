import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontWeight font;
  final String family;

  AppText(
      {Key? key, this.size = 16, required this.text, this.color=Colors.black, this.font=FontWeight.normal, this.family='georgia'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: font,
        fontFamily: family,
      ),
    );
  }
}
