import 'package:flutter/material.dart';

import './indicator.dart';

class IndicatorSubjectCard extends StatelessWidget {
  final List<Color> colors;

  IndicatorSubjectCard({this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Indicator(
              color: colors[0],
              text: 'Deutsch',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: colors[1],
              text: 'Englisch',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: colors[2],
              text: 'Mathe',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: colors[3],
              text: 'Gesamt',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
          ],
      ),
    );
  }
}
