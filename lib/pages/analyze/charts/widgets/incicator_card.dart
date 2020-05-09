import 'package:flexed_mobile/pages/analyze/charts/widgets/indicator.dart';
import 'package:flutter/material.dart';

class IndicatorCard extends StatelessWidget {
  static const Color colorGerman = Color(0xff0293ee);
  static const Color colorEnglish = Color(0xfff8b250);
  static const Color colorMath = Color(0xff5ac18e);
  static const Color colorTotal = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Indicator(
              color: colorGerman,
              text: 'Deutsch',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: colorEnglish,
              text: 'Englisch',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: colorMath,
              text: 'Mathe',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: colorTotal,
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
