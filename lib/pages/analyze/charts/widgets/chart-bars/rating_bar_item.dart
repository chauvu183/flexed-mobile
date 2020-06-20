import 'package:flutter/material.dart';

import './bar_item.dart';

// the bars used for the rating charts
class RatingBarItem extends BarItem  {
  final Color color;
  final double height;
  final double width = 35;
  final int timesPicked;
  final IconData icon;
  final double iconSize = 38;
  final Color iconColor = Colors.black;


  RatingBarItem({this.color, this.height = 0, this.timesPicked, this.icon});
  
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
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        )
      ];
  }
}