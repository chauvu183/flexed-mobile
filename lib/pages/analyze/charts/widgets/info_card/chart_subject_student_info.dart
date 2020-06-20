import 'package:flutter/material.dart';

import './ichart_info.dart';
import '../../../../../types/enums/gender.dart';
import '../../../../../types/enums/special_educational_needs.dart';
import 'icon_title.dart';

class ChartSubjectStudentInfo extends IChartInfo {
  final String fullName;
  final SpecialEducationalNeeds specialEducationalNeeds;
  final int solTrackingsOpen;
  final int solTrackingsRated;
  final Gender gender;

  ChartSubjectStudentInfo({
    @required this.fullName,
    this.specialEducationalNeeds,
    this.solTrackingsOpen,
    this.solTrackingsRated,
    this.gender,
  });

  @override
  List<Widget> declareChildren(BuildContext context) {
    return [
      Text('SOL Stunden: ${(solTrackingsOpen + solTrackingsRated).ceil()}'),
      Spacer(),
      Text('bewertet: ${solTrackingsRated.ceil()}'),
      Spacer(),
      Text('offen: ${solTrackingsOpen.ceil()}'),
    ];
  }

  Text _checkSpecialNeeds() {
    switch (specialEducationalNeeds) {
      case SpecialEducationalNeeds.GERMAN_AS_SECOND_LANGUAGE:
        return Text('Deutsch als Zweitsprache');
        break;
      case SpecialEducationalNeeds.SPECIAL_NEEDS:
        return Text('Förderbedarf');
      default:
        return Text("");
    }
  }

  IconTitle buildIconTitle() {
    String url = gender == Gender.MALE
        ? 'images/boy.png'
        : 'images/girl.png';
        print(url);
    return IconTitle(
      url: url,
      title: fullName,
      needs: _checkSpecialNeeds(),
    );
  }
}
