import 'package:flutter/material.dart';

class BottomNavDivider extends StatelessWidget {
  final bool finalOrFirst;
  final Color mainColor = Colors.black;

  BottomNavDivider({this.finalOrFirst = false});

  @override
  Widget build(BuildContext context) {
    Color color = finalOrFirst ? Colors.white : mainColor;
    return VerticalDivider(
      color: color,
      indent: 10,
      endIndent: 10,
      thickness: 1.5,
    );
  }
}
