import 'package:flutter/material.dart';

import './ichart_info.dart';
import '../../../../../types/enums/special_educational_needs.dart';

class ChartRatingStudentInfo extends IChartInfo {
  final String fullName;
  final SpecialEducationalNeeds specialEducationalNeeds;
  final int numberRatings;

  ChartRatingStudentInfo({
    @required this.fullName,
    this.specialEducationalNeeds,
    this.numberRatings,
  });

  @override
  List<Widget> declareChildren(BuildContext context) {
    return [
      Text(
        'Name: $fullName',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      _checkSpecialNeeds(),
      Text('Bewertungen: ${numberRatings.ceil()}'),
    ];
  }

  Text _checkSpecialNeeds() {
     switch (specialEducationalNeeds) {
        case SpecialEducationalNeeds.GERMAN_AS_SECOND_LANGUAGE:
          return Text('Förderstatus: DAZ');
          break;
        case SpecialEducationalNeeds.SPECIAL_NEEDS:
         return Text('Förderstatus: Förderbedarf');
        default:
           return Text("");
      }
  }
}
