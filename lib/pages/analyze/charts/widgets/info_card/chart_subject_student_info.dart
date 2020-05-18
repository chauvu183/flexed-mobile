import 'package:flutter/material.dart';

import './ichart_info.dart';
import '../../../../../types/enums/special_educational_needs.dart';

class ChartSubjectStudentInfo extends IChartInfo {
  final String fullName;
  final SpecialEducationalNeeds specialEducationalNeeds;
  final int solTrackingsOpen;
  final int solTrackingsRated;

  ChartSubjectStudentInfo({
    @required this.fullName,
    this.specialEducationalNeeds,
    this.solTrackingsOpen,
    this.solTrackingsRated,
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('SOL Stunden: ${(solTrackingsOpen + solTrackingsRated).ceil()}'),
          Text('bewertet: ${solTrackingsRated.ceil()}'),
          Text('offen: ${solTrackingsOpen.ceil()}'),
        ],
      ),
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
