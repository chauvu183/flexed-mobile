import 'package:flutter/material.dart';

import '../charts/ichart.dart';

class PlaceholderChart extends IChart {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.bottomRight,
              image: AssetImage(
                'images/background.png',
              ),
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.assessment,
            size: 160,
            color: Color(0xFF14BD9C),
          ),
        ),
      ]),
    );
  }
}
