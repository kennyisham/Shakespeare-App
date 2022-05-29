import 'package:flutter/material.dart';

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final double size;

  const StackedWidgets({
    Key? key,
    required this.items,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items.map((item) {
      final value = Container(
        width: size,
        height: 65,
        child: item,
      );

      return value;
    }).toList();

    return Container(
      //color: Colors.blue,
      //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: allItems,
      ),
    );
  }
}