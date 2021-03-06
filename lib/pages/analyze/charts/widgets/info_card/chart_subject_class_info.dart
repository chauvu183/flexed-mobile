import 'package:flutter/material.dart';

import './ichart_info.dart';
import 'icon_title.dart';

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

  // build the text widgets shown in the chartinfo card
  @override
  List<Widget> declareChildren(BuildContext context) {
    return [
      Text('gesamt: ${(solTrackingsOpen + solTrackingsRated).ceil()}'),
      Text('bewertet: ${solTrackingsRated.ceil()}'),
      Text('offen: ${solTrackingsOpen.ceil()}'),
    ];
  }

  // if a class is chosen, show teacher image and number of students
  IconTitle buildIconTitle() {
    return IconTitle(
      url: 'images/teacher.png',
      title: title,
      numberStudents: this.numberStudents,
    );
  }
}
