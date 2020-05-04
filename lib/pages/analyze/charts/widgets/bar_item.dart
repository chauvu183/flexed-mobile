import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  final Color color;
  final double height;
  final double _width = 50;
  final int timesPicked;

  BarItem({this.color, this.height = 0, this.timesPicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('$timesPicked'),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _width,
          height: height.isNaN ? 0 : height,
          color: color,
        ),
      ],
    );
  }
}
