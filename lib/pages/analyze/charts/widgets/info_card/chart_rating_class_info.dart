import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'package:flutter/material.dart';

class ChartRatingClassInfo extends IChartInfo {
  final String title;
  final int numberStudents;
  final int numberRatings;

  ChartRatingClassInfo({
    @required this.title,
    this.numberStudents,
    this.numberRatings,
  });

  @override
  List<Text> declareChildren(BuildContext context) {
    return [
      Text(
        'Klasse: $title',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      Text('Schüler: $numberStudents'),
      Text('Bewertungen: ${numberRatings.ceil()}'),
    ];
  }
}