import 'package:flutter/material.dart';

import './ichart_info.dart';

class ChartSubjectClassInfo extends IChartInfo {
  final String title;
  final int numberStudents;
  final int solTrackingsOpen;
  final int solTrackingsRated;

  ChartSubjectClassInfo({
    @required this.title,
    this.numberStudents,
    this.solTrackingsOpen,
    this.solTrackingsRated,
  });

  @override
  List<Widget> declareChildren(BuildContext context) {
    return [
      Text(
        'Klasse: $title',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      Text('Schüler: $numberStudents'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('SOL Stunden: '),

          Text('gesamt: ${(solTrackingsOpen + solTrackingsRated).ceil()}'),
          Text('bewertet: ${solTrackingsRated.ceil()}'),
          Text('offen: ${solTrackingsOpen.ceil()}'),
        ],
      ),
    ];
  }
}
