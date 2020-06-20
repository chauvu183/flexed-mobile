import 'package:flutter/material.dart';

import './ichart_info.dart';
import 'icon_title.dart';

class ChartRatingClassInfo extends IChartInfo {
  final String title;
  final int numberStudents;
  final int numberRatings;

  ChartRatingClassInfo({
    @required this.title,
    this.numberStudents,
    this.numberRatings,
  });

  // build the text widgets shown in the chartinfo card
  @override
  List<Text> declareChildren(BuildContext context) {
    return [
      Text('Bewertungen: ${numberRatings.ceil()}'),
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
