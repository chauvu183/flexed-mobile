import 'package:flexed_mobile/pages/analyze/charts/widgets/indicator.dart';
import 'package:flutter/material.dart';

class IndicatorCard extends StatelessWidget {
  final List<String> indicatorNames;
  final List<Color> usedColors;

  IndicatorCard({this.indicatorNames, this.usedColors});

  @override
  Widget build(BuildContext context) {
    List<Indicator> indicators;

    for (var i = 0; i < indicators.length - 1; i++) {
      indicators.add(Indicator(
        text: indicatorNames[i],
        color: usedColors[i],
        isSquare: true,
      ));
    }

    return Card(
      child: Row(
        children: [
          ...indicators,
        ],
      ),
    );
  }
}
