import 'package:flutter/material.dart';

import './bar_item.dart';

// THE BARS THAT ARE USED FOR THE SUBJECT CHARTS
class SubjectBarItem extends BarItem {
  final Color color;
  final double height;
  final double width = 50.0;
  final int timesPicked;
  final String label;

  SubjectBarItem({this.color, this.height = 0, this.timesPicked, this.label});
  @override
  List<Widget> declareChildren() {
    return [
        Text('$timesPicked'),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: width,
          height: height.isNaN ? 0 : height,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(label),
        ),
      ];
  }
}